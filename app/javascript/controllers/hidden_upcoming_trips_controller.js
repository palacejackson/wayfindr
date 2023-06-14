import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-upcoming-trips"
export default class extends Controller {
  static targets = ["hidden", "button"]

  connect() {
    console.log("I am connected")
    console.log(this.hiddenTargets)
  }

  showHiddenTrips() {
    console.log("listening");
    console.log(this.hiddenTargets);
    this.hiddenTargets.forEach((target) => {
      target.classList.toggle("d-none");
    });
    console.dir(this.buttonTarget)
    if (this.buttonTarget.innerHTML === "See all") {
       this.buttonTarget.innerHTML = "See less"
       window.scrollTo(0,300);
      } else {
        this.buttonTarget.innerHTML = "See all";
        window.scrollTo(0,150);
      };
  }
}
