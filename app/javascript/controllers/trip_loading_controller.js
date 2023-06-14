import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trip-loading"
export default class extends Controller {
  static targets = ['generating', 'form']
  connect() {
    console.log("Connected to trip_loading!");
  }

  submit(event) {
    event.preventDefault()
    console.log(event)
    this.formTarget.classList.add('away')
    this.generatingTarget.classList.remove('away')
    // hide modal/form
        // show loading modal with spinny animation finishing after 4 seconds
    // then we leave the page automatically because form gets submitted
    setTimeout(() => {
      event.target.form.submit()
    }, 4000);
  }
}
