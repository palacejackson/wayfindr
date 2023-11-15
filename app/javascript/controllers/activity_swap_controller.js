import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-swap"
export default class extends Controller {
  static targets = ["swapButton", "activityCard", "form"]

  connect() {
    console.log("connected")
  }

  swap(e) {
    e.preventDefault();
    // looking at the url and grabbing the trip id
    const currentUrl = new URL(window.location);
    const swappedActivityId = e.target.dataset.id
    const url = currentUrl.pathname;
    const trip = parseInt(url.replace(/\D/g, ''), 10);
    // getting correct activity card related to which swap button user clicks
    const activityCard = e.target.parentElement.parentElement.parentElement.parentElement;
    // fetch method - going to the patch trip_activity/:id
    fetch(`/trip_activities/${swappedActivityId}`, {
      method: 'PATCH',
      // we are sending the server the id of the trip
      body: JSON.stringify(trip),
      headers: {
        'Content-Type': 'application/json'
      },
    }).then(response => {
      if(response.ok) {
        // reponse.text instead of json as we are expecting to receive html of the new activity card to insert
        return response.text();
      }
    }).then(html => {
      // html instead of data
      // we get the activity card that we found earlier and change it to the newly generated activity card with the new html
      activityCard.outerHTML = html
    });
  }
}
