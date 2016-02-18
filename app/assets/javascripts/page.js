//= require jquery 
//= require jquery_ujs
//= require pages/vendor/bootstrap.min
//= require pages/vendor/jquery.easing.min
//= require pages/vendor/angular.min
//= require pages/main
//= require pages/map
//= require pages/vendor/jquery.easy-autocomplete.min
//= require pages/vendor/bootstrap-combobox

$( ".submit-cambio" ).click(function() {
  document.documentElement.className += 'js';
});          


var options = {

	url: function(phrase) {
		return "/search_companies?name=" + phrase;
	},	
	
	getValue: "name",

	list: {
		maxNumberOfElements: 10,
		match: {
			enabled: true
		},
		showAnimation: {
			type: "fade", //normal|slide|fade
			time: 400,
			callback: function() {}
		},		
	},
	template: {
			type: "iconLeft",
			fields: {
				iconSrc: "avatar_url"
			}
		}

};

$("#search_companies").easyAutocomplete(options);


$(document).ready(function() {
	$("#have").combobox();
	$("#want").combobox();
	$("#where").combobox();
	$('#newsletter_submit').prop('disabled', 'disabled');
});