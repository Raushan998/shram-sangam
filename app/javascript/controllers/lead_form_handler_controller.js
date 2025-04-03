import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("ajax:success", this.resetForm.bind(this))
  }

  resetForm(event) {
    const [data, status, xhr] = event.detail
    if (xhr.status === 200) {
      this.element.reset()
    }
  }
}