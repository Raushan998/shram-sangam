import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { phone: String }
  static targets = ["phoneInput", "formContainer", "thankYouMessage", "phoneDisplay"]
  
  connect() {
    // Check if this is a phone display controller (in the worker list)
    if (this.hasPhoneDisplayTarget) {
      this.originalText = this.phoneDisplayTarget.textContent;
    }
    
    // Initialize tooltips if needed
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
  
  // For simple phone display in worker list
  show() {
    if (this.element) {
      this.element.innerHTML = `<i class="bi bi-telephone me-1"></i> ${this.phoneValue}`
    }
  }

  hide() {
    if (this.element && !this.element.classList.contains('clicked')) {
      this.element.innerHTML = `<i class="bi bi-eye me-1"></i> Show Number`
    }
  }
  
  call(event) {
    event.preventDefault();
    if (this.element) {
      this.element.classList.add('clicked');
      window.location.href = `tel:${this.phoneValue}`;
    }
  }
  
  // For worker registration modal
  async submit() {
    // Check if we have the phone input (for the registration form)
    if (!this.hasPhoneInputTarget) return;
    
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
      console.error("Error submitting form:", error.message);
      alert("An error occurred while submitting the form. Please try again later.");
    }
  }
}