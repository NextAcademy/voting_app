//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require_self

$(document).ready(function() {
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
  });
});

window.setTimeout(function() {
  $("#note").fadeTo(500, 0).slideUp(500, function() {
    $(this).remove();
  });
}, 1000);