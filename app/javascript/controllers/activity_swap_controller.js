import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-swap"
export default class extends Controller {
  static targets = ["swapButton", "activityCard", "form"]

  connect() {
    console.log("connected")
    window.scrollTo(0, 75)
  }

  swap(e) {
    e.preventDefault();
    const swappedActivityId = e.target.dataset.id
    console.log(swappedActivityId);
    this.formTargets.forEach((form) => {
      if (form.dataset.id == swappedActivityId) {
        console.log(form);
        console.log(form.action)
        form.requestSubmit();
      }
    })
    // fetch({
    // })
  }
}
