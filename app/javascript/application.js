// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
//= require jquery
//= require jquery_ujs
//= require_tree
//= require font-awesome
import * as bootstrap from "bootstrap"
let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})





