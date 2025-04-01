import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { phone: String }
  static targets = ["phoneInput", "formContainer", "thankYouMessage"];
  
  show() {
    this.element.innerHTML = `<i class="bi bi-telephone me-1"></i> ${this.phoneValue}`
  }

  hide() {
    this.element.innerHTML = `<i class="bi bi-eye me-1"></i> Show Number`
  }

  call() {
    window.location.href = `tel:${this.phoneValue}`
  }

  connect() {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    this.tooltips = tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl, {
        boundary: document.body
      })
    })
  }
  
  disconnect() {
    if (this.tooltips) {
      this.tooltips.forEach(tooltip => tooltip.dispose())
    }
  }

  async submit() {
    const phoneNumber = this.phoneInputTarget.value.trim();
    if (!phoneNumber) {
      alert("Please enter your phone number.");
      return;
    }

    const csrfToken = document.querySelector("[name='csrf-token']").content;

    try {
      const response = await fetch("/leads", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,
        },
        body: JSON.stringify({ lead: { phone_number: phoneNumber } }),
      });

      if (response.ok) {
        this.formContainerTarget.classList.add("d-none");
        this.thankYouMessageTarget.classList.remove("d-none");
      } else {
        const errorData = await response.json();
        alert(`Error: ${errorData.error}`);
      }
    } catch (error) {
      console.log(error.message)
      alert(error)
    }
  }
}