import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container"];

  connect() {
    console.log("Address controller connected");
  }

  add() {
    const timestamp = new Date().getTime();
    const template = `
      <div class="address-form border p-3 mb-3 rounded">
        <input type="hidden" name="work[addresses_attributes][${timestamp}][_destroy]" value="false">
        <div class="row">
          <div class="col-md-12 mb-3">
            <label class="form-label">Street</label>
            <input class="form-control" placeholder="Street address" type="text" name="work[addresses_attributes][${timestamp}][street]">
          </div>
          <div class="col-md-12 mb-3">
            <label class="form-label">Landmark</label>
            <input class="form-control" placeholder="Landmark" type="text" name="work[addresses_attributes][${timestamp}][landmark]">
          </div>
          <div class="col-md-4 mb-3">
            <label class="form-label">City</label>
            <input class="form-control" placeholder="City" type="text" name="work[addresses_attributes][${timestamp}][city]">
          </div>
          <div class="col-md-4 mb-3">
            <label class="form-label">State</label>
            <input class="form-control" placeholder="State" type="text" name="work[addresses_attributes][${timestamp}][state]">
          </div>
          <div class="col-md-4 mb-3">
            <label class="form-label">Postal Code</label>
            <input class="form-control" placeholder="Postal Code" type="text" name="work[addresses_attributes][${timestamp}][postal_code]">
          </div>
          <div class="col-md-8 mb-3">
            <label class="form-label">Country</label>
            <input class="form-control" placeholder="Country" type="text" name="work[addresses_attributes][${timestamp}][country]">
          </div>
          <div class="col-md-4 mb-3 d-flex align-items-end">
            <button type="button" class="btn btn-sm btn-outline-danger" data-action="address#remove">Remove</button>
          </div>
        </div>
      </div>
    `;
    this.containerTarget.insertAdjacentHTML("beforeend", template);
  }

  remove(event) {
    const addressForm = event.target.closest(".address-form");
    const destroyField = addressForm.querySelector('input[name*="_destroy"]');
    if (destroyField) {
      destroyField.value = "1";
      addressForm.style.display = "none";
    } else {
      addressForm.remove();
    }
  }
}
