import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Controller connected"); // Controller isn't connecting :(
  }

  submit() {
    this.formTarget.submit();
  }
}
