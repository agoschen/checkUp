// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
