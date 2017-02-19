//= require jquery
//= require jquery_ujs
//= require_self

$(document).ready(function() {
  $('#help-btn').click(function() {
    $("#help-overlay").fadeIn(500);
  });

  $("#help-overlay").click(function() {
    $('#help-overlay').fadeOut(500);
  });

  $('.closebtn').click(function() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
  });

  $('.header').click(function() {
    document.getElementById("mySidenav").style.width = "70px";
    document.getElementById("main").style.marginLeft = "70px";
  });

  // var button = $('.form-wrapper button');
  // var input = $('.form-wrapper input');

  // $('.form-wrapper').on('ajax:before', function() {
  //   button.html('<i class="fa fa-cog fa-spin fa-2x fa-fw middle"></i>');
  //   button.animate({
  //     width: '+=' + input.width() * 0.5
  //   }, 0);
  //   input.animate({
  //     width: '-=' + input.width() * 0.5
  //   }, 0);
  // });

});

window.setTimeout(function() {
  $("#note").fadeTo(500, 0).slideUp(500, function() {
    $(this).remove();
  });
}, 1000);