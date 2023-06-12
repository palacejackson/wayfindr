import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="before-unload"
export default class extends Controller {
  connect() {
    console.log("hello");
    window.onbeforeunload = function () {
      window.scrollTo(0, 0);
  }
  }
}
