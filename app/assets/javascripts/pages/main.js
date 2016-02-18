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
  			modal.find('.modal-title').text('Olá gostia de ser nosso parceiro?')
  	};
})
