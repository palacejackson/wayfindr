import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-swap"
export default class extends Controller {
  static targets = ["swapButton", "activityCard"]

  connect() {
    console.log("connected")
  }

  swap(e) {
    e.preventDefault();
    const swappedActivityId = e.target.dataset.id
    console.log(swappedActivity);
    console.log(e.target.dataset.id);
    fetch()
  }
}
