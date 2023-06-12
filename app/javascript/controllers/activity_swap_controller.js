import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-swap"
export default class extends Controller {
  static targets = ["swapButton", "activityCard"]

  connect() {
    console.log("connected")
  }

  swap(e) {
    e.preventDefault()
    console.log(e)
    console.log(this.swapButtonTargets)
    console.log(this.activityCardTargets)
  }
}
