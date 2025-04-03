import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { phone: String }
  static targets = ["phoneInput", "formContainer", "thankYouMessage", "phoneDisplay"]
  
  connect() {
    this.buttonText = this.element.querySelector('.button-text');
  }

  show() {
    this.element.innerHTML = `<i class="bi bi-telephone me-1"></i> ${this.phoneValue}`
  }

  hide() {
    this.element.innerHTML = `<i class="bi bi-eye me-1"></i> Show Number`;
  }

  call() {
    window.location.href = `tel:${this.phoneValue}`;
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