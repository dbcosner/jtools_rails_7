// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"  
import "./controllers"  
import * as bootstrap from "bootstrap"  

// See : https://www.bootrails.com/blog/rails-7-bootstrap-5-tutorial/
let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
  return new bootstrap.Popover(popoverTriggerEl)  
})  

// See : https://medium.com/daily-web-dev/use-bootstrap-4-with-ruby-on-rails-6-and-webpack-fe7300604267
// import "../stylesheets/application"
// document.addEventListener("DOMContentLoaded", function(event) {
//   var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
//   var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//     return new bootstrap.Popover(popoverTriggerEl)
//   })

//   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
//   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//     return new bootstrap.Tooltip(tooltipTriggerEl)
//   })
// });import * as bootstrap from "bootstrap"
