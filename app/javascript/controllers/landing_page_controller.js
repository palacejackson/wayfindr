import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="landing-page"
export default class extends Controller {
  static targets = ["destination", "textbox"]
  connect() {
    console.log("connected to landing page controller")
  }

  submit() {
    console.log("hello");
    console.dir(this.textboxTarget)
    if (this.textboxTarget)
    this.destinationTarget.setAttribute("value", `${this.textboxTarget.value}`)
  }
}
