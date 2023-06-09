import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="landing-page"
export default class extends Controller {
  static targets = ["destination", "textbox"]

  submit() {
    console.log("hello");
    console.dir(this.textboxTarget)
    this.destinationTarget.setAttribute("value", `${this.textboxTarget.value}`)
  }
}
