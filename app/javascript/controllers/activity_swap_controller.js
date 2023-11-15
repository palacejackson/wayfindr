import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-swap"
export default class extends Controller {
  static targets = ["swapButton", "activityCard", "form"]

  connect() {
    console.log("connected")
  }

  swap(e) {
    e.preventDefault();
    const currentUrl = new URL(window.location);
    const swappedActivityId = e.target.dataset.id
    const url = currentUrl.pathname;
    const trip = parseInt(url.replace(/\D/g, ''), 10);
    const activityCard = e.target.parentElement.parentElement.parentElement.parentElement;
    console.log(trip);
    console.log(swappedActivityId);
    fetch(`/trip_activities/${swappedActivityId}`, {
      method: 'PATCH',
      body: JSON.stringify(trip),
      headers: {
        'Content-Type': 'application/json'
      },
    }).then(response => {
      if(response.ok) {
        return response.text();
      }
    }).then(html => {
      activityCard.outerHTML = html
    });

    console.dir(activityCard)
    // activityCard.outerHTML = html response of the rendered partial with all the new info
  }
}
