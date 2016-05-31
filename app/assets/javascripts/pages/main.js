//habilita botão
$('#newsletters_accept').click(function (){
	if ($('#newsletters_accept').is(':checked')){
    $('#newsletter_submit').prop('disabled', false);        // enables button
  } else {
    $('#newsletter_submit').prop('disabled', 'disabled');   // disables button
	}
});


$('#adshere').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget)
  var recipient = button.data('whatever')
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  	if (recipient == 'getcontact'){
			$('#contact_set_type').val('0');

			modal.find('.modal-title').text('Alguma duvida? algo que podemos melhorar?')

  	}else{
  		$('#contact_set_type').val('1');
  			modal.find('.modal-title').text('Olá gostaria de ser nosso parceiro?')
  	};
})


$( ".submit-cambio" ).click(function() {
  document.documentElement.className += 'js';
});

//busca casa de cambio
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
  if ($("#have option:selected").val() != '' && $("#want option:selected").val() != '' && $("#where option:selected").val() != ''){
    $('.submit-cambio').prop('disabled', false);
  }else{
    $('.submit-cambio').prop('disabled', 'disabled');
  };
});

$('#have').bind('change', function () {
  if ($("#have option:selected").val() != '' && $("#want option:selected").val() != '' && $("#where option:selected").val() != ''){
    $('.submit-cambio').prop('disabled', false);
  }else{
    $('.submit-cambio').prop('disabled', 'disabled');
  };

  if ($("#have option:selected").val() == $("#want option:selected").val() ){
    alert('Ops! Moedas Iguais');
  };
});

$('#want').bind('change', function () {
  if ($("#have option:selected").val() != '' && $("#want option:selected").val() != '' && $("#where option:selected").val() != ''){
    $('.submit-cambio').prop('disabled', false);
  }else{
    $('.submit-cambio').prop('disabled', 'disabled');
  };

  if ($("#have option:selected").val() == $("#want option:selected").val() ){
    alert('Ops! Moedas Iguais');
  };

});

$('#where').bind('change', function () {
  if ($("#have option:selected").val() != '' && $("#want option:selected").val() != '' && $("#where option:selected").val() != ''){
    $('.submit-cambio').prop('disabled', false);
  }else{
    $('.submit-cambio').prop('disabled', 'disabled');
  };

  if ($("#have option:selected").val() == $("#want option:selected").val() ){
    alert('Ops! Moedas Iguais');
  };
});



jQuery(document).ready(function($){
  // browser window scroll (in pixels) after which the "back to top" link is shown
  var offset = 300,
    //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
    offset_opacity = 1200,
    //duration of the top scrolling animation (in ms)
    scroll_top_duration = 700,
    //grab the "back to top" link
    $back_to_top = $('.cd-top');

  //hide or show the "back to top" link
  $(window).scroll(function(){
    ( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
    if( $(this).scrollTop() > offset_opacity ) { 
      $back_to_top.addClass('cd-fade-out');
    }
  });

  //smooth scroll to top
  $back_to_top.on('click', function(event){
    event.preventDefault();
    $('body,html').animate({
      scrollTop: 0 ,
      }, scroll_top_duration
    );
  });

});