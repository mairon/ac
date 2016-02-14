//= require jquery 
//= require jquery_ujs
//= require pages/vendor/bootstrap.min
//= require pages/vendor/jquery.easing.min
//= require pages/vendor/angular.min
//= require pages/main
//= require pages/vendor/jquery.selectbox-0.2
//= require pages/map
//= require select2
//= require pages/vendor/jquery.easy-autocomplete.min

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
	$("#have").select2({});
	$("#want").select2({});
	$("#where").select2({});
});