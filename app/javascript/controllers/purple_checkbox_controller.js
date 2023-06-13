import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purple-checkbox"
export default class extends Controller {
  static targets = ["checkboxes"]
  connect() {
    console.log("Connected!")
    console.log(this.checkboxesTargets)
  }

  fire(e) {
    // e.preventDefault()
    // console.log("fired")
    console.log(e.currentTarget)
    console.log(e.currentTarget.nextSibling)
    e.currentTarget.nextSibling.classList.toggle("purple")
  }
}
