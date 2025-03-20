// Import and register all your controllers from the importmap via controllers/**/*_controller
import { Application } from '@hotwired/stimulus'
import WorkerController from "./worker_controller"

const application = Application.start()
application.register("worker", WorkerController)