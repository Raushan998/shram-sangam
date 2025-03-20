// app/javascript/controllers/worker_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { phone: String }

  show() {
    this.element.innerHTML = `<i class="bi bi-telephone me-1"></i> ${this.phoneValue}`
  }

  hide() {
    this.element.innerHTML = `<i class="bi bi-eye me-1"></i> Show Number`
  }

  call() {
    window.location.href = `tel:${this.phoneValue}`
  }
}
