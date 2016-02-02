//= require jquery 
//= require jquery_ujs
//= require pages/vendor/bootstrap.min
//= require pages/vendor/jquery.easing.min
//= require pages/vendor/angular.min
//= require pages/main
//= require pages/vendor/jquery.selectbox-0.2
//= require pages/map

$( ".submit-cambio" ).click(function() {
  document.documentElement.className += 'js';
});          

$(function () {
  $("#have").selectbox();
});

$(function () {
  $("#want").selectbox();
});

$(function () {
  $("#where").selectbox();
});