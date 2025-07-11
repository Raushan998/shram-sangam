// Import and register all your controllers from the importmap via controllers/**/*_controller
import { Application } from '@hotwired/stimulus'
import WorkerController from "./worker_controller"
import LeadFormHandlerController from "./lead_form_handler_controller"
import AddressController from './address_controller'       

const application = Application.start()
application.register("worker", WorkerController)
application.register("lead-form-handler", LeadFormHandlerController)
application.register("address", AddressController)