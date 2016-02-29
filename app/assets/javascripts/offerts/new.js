jQuery.noConflict();
(function( $ ) {

    var el = {
        $offertSolicitation : $('#offert-solicitation'),
        $haveInput : $('#haveInput'),
        $exchangeInput : $('#exchangeInput'),
        $linkMakeOffert : $( '.make-offert' ),

        calc : function () {
            return el.$haveInput.val() * el.$exchangeInput.val()
        },

        printResult : function ( value ) {

            value = value || el.calc();

            if ( value < 100 ) {
            el.$offertSolicitation
                .addClass('error')
                .text( 'Mínimo: USD 100' );
            }
            else {
                el.$offertSolicitation
                    .addClass('error')
                    .html( 'Você tem boa chance!<br/>Total: R$ ' + value.toFixed(2) );
            }
        },

    };

    var showOffert = function ( options ) {
        $('#offert-container').show();
        $( '#offert_company_id' ).val( options.company_id );

        $( '#js-thumbnail-offert' ).html( options.logo );
    }

    var triggerCalc = function( event ) {
        event.preventDefault();
        el.printResult();
    };

    var triggerLinkOffert = function (event) {
        event.preventDefault();

        var $this = $(this),
            $resultContent = $this.closest('.result-content'),
            $search = $this.closest('#search');


        if ( $search.data('user_signed_in') === false ) {
            document.cookie="company_id=" + $this.data('company_id');
            window.location.href = '/users/sign_in';
            return;
        }

        showOffert ({
            company_id: $this.data('company_id'),
            logo: $resultContent.find('.thumbnail').clone()
        });

    };

    var getCookie = function (cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    };

    function delete_cookie( name ) {
      document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }


    var companyIdCookie = getCookie('company_id');

    // cookie used after login
    if ( companyIdCookie ) {
        delete_cookie( 'company_id' );

        showOffert ({
            company_id: companyIdCookie,
            logo: $('#search').find( ".thumbnail." + companyIdCookie ).clone()
        });
    }

    /* Events
    ************************/

    el.$haveInput.on( 'keyup', triggerCalc );
    el.$exchangeInput.on( 'keyup', triggerCalc );
    el.$exchangeInput.on( 'change', triggerCalc );

    el.$linkMakeOffert.on( 'click', triggerLinkOffert );


    $('#new_offert').on( 'ajax:success', function (e, data, status, xhr) {
        $('#offert-container').hide();
        alert('Oferta cadastrada com sucesso!');
    });

})(jQuery);
