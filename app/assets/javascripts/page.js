//= require jquery 
//= require jquery_ujs
//= require pages/vendor/bootstrap.min
//= require pages/vendor/jquery.easing.min
//= require pages/vendor/angular.min
//= require pages/map
//= require pages/vendor/jquery.easy-autocomplete.min
//= require pages/vendor/bootstrap-combobox
//= require pages/main


$("#partial_sign_in").click(function(){
	$(".sign_in").css('display', 'block');
	$(".sign_up").css('display', 'none');
})

$("#partial_sign_up").click(function(){
	$(".sign_in").css('display', 'none');
	$(".sign_up").css('display', 'block');
})


$("form#sign_in_user").bind("ajax:success", function(e, data, status, xhr) {
  if (data.success) {
    $('.sign_in').hide();
    return alert(data.email);
  } else {
    return alert('failure!');
  }
});
