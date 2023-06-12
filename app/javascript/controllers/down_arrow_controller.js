import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  scrollToBottom() {
    console.log("hello");
    const height = document.body.scrollHeight
    window.scroll(0, height)
  }
}
