import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap(this.markersValue)
    this.#addActivityMarkersToMap(this.markersValue)
    this.#fitMapToMarkers()
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #addActivityMarkersToMap(activityMarkers) {
    activityMarkers.forEach((marker) => {
      // console.log(marker);
      // console.log(marker.activitymap_info_html)
      const popup = new mapboxgl.Popup().setHTML(marker.activitymap_info_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.map_marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })

  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    // this.activityMarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
