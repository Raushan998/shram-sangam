// Import and register all your controllers from the importmap via controllers/**/*_controller
import { Application } from '@hotwired/stimulus'
import WorkerController from "./worker_controller"

window.Stimulus = Application.start()
Stimulus.register("worker", WorkerController)