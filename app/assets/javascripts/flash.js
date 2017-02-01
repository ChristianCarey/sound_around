$(document).ready(function(){
  var $flash = $('#flash');
  $flash.hide();
  $flash.slideDown(400);
  setTimeout(function() {
    $('#flash').slideUp(400)
  }, 2500)
});