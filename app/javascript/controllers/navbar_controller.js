import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    window.scrollTo(0, 0);
  }

  scroll(e) {
    console.dir(this.element);
    if (e.currentTarget.pageYOffset >= 150) {
      this.element.classList.add("d-none")
    } else {
      this.element.classList.remove("d-none")
    }

  }
}
