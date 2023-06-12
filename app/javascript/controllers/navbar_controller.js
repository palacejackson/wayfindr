import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    window.scrollTo(0, 0);
  }


  scroll(e) {
    console.dir(this.element);
    if (e.currentTarget.pageYOffset >= 100) {
      this.element.classList.add("white-background")
      this.element.classList.remove("transparent")
    } else {
      this.element.classList.add("transparent")
      this.element.classList.remove("white-background")
    }

  }
}
