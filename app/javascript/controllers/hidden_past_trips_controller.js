import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-past-trips"
export default class extends Controller {
  static targets = ["hidden", "button"]
  connect() {
    console.log("I am connected")
  }

  showHiddenTrips() {
    console.log("listening");
    console.log(this.hiddenTargets);
    this.hiddenTargets.forEach((target) => {
      target.classList.toggle("d-none");
    });
    console.dir(this.buttonTarget)
    if (this.buttonTarget.innerHTML === "See all past trips") {
       this.buttonTarget.innerHTML = "See less"
       window.scrollTo(0,750);
      } else {
        this.buttonTarget.innerHTML = "See all past trips";
      };
  }
}
