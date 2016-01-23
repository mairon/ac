
//= require jquery
// require js/gebo_common
//= require js/jquery.debouncedresize.min
//= require js/jquery.actual.min
//= require js/jquery.cookie.min
//= require bootstrap/js/bootstrap.3.3.5
//= require lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min
//= require js/ios-orientationchange-fix
//= require lib/antiscroll/jquery-mousewheel
//= require lib/antiscroll/antiscroll

//= require js/forms/jquery.counter.min
//= require lib/jquery-ui/jquery-ui-1.8.20.custom.min
//= require js/forms/jquery.ui.touch-punch.min
//= require js/jquery.imagesloaded.min
//= require js/jquery.wookmark
//= require js/jquery.mediaTable.min
//= require js/jquery.peity.min
//= require js/gebo_dashboard
//= require js/bootstrap.plugins
//= require jquery_ujs
//= require lib/datatables/jquery.dataTables.min
//= require lib/datatables/ZeroClipboard
//= require lib/datatables/TableTools.min
//= require lib/datatables/jquery.dataTables.sorting
//= require lib/datatables/extras/Scroller/media/js/Scroller.min
//= require js/gebo_datatables
//= require jquery.maskMoney
//= require jquery.maskedinput

//= require admin/search-map
//= require admin/infobox
//= require admin/markerclusterer
//= require admin/noo-property-google-map
//= require admin/property
//= require admin/data-nooGmapL10n




$(document).ready(function() {
  $(".cep").mask("99999-999");
  $(".cnpj").mask("99.999.999/9999-99");
  $(".cpf").mask("999.999.999-99");

  $(".rg").bind("keyup blur focus", function(e) {
          e.preventDefault();
          var expre = /[^0-9]/g;
          // REMOVE OS CARACTERES DA EXPRESSAO ACIMA
          if ($(this).val().match(expre))
              $(this).val($(this).val().replace(expre,''));
      });
      //somente numero
      $(".number").bind("keyup blur focus", function(e) {
          e.preventDefault();
          var expre = /[^0-9]/g;
          // REMOVE OS CARACTERES DA EXPRESSAO ACIMA
          if ($(this).val().match(expre))
              $(this).val($(this).val().replace(expre,''));
      });
  //mascara de moeda
  $(".money").maskMoney({thousands:".", decimal:","});
  //* show all elements & remove preloader
  setTimeout('$("html").removeClass("js")',1000);

});

$(function () {
    var columnWidths = new Array();

    // Get column widths
    $("#headerRow").find('th').each(function (index) {
        columnWidths[index] = $(this).width();
    });

    // get column data for header
    var tableHeaderRow = $("#headerRow").html();

    // clear header
    $("#headerRow").html("");
    // insert header data into new table container
    $("#newTableHeader").html(tableHeaderRow);

    // modify column width for header
    $("#newTableHeader").find('th').each(function (index) {
        $(this).css("width", columnWidths[index]);
    });

    // modify column width for
    // go to the next row, first row considered header column
    $("#targetTable tr:first").next().find('th').each(function (index) {
        $(this).css("width", columnWidths[index]);
    });


    // Get column widths
    $("#headerRow2").find('th').each(function (index) {
        columnWidths[index] = $(this).width();
    });

    // get column data for header
    var tableHeaderRow = $("#headerRow2").html();

    // clear header
    $("#headerRow2").html("");
    // insert header data into new table container
    $("#newTableHeader2").html(tableHeaderRow);

    // modify column width for header
    $("#newTableHeader2").find('th').each(function (index) {
        $(this).css("width", columnWidths[index]);
    });

    // modify column width for
    // go to the next row, first row considered header column
    $("#targetTable2 tr:first").next().find('th').each(function (index) {
        $(this).css("width", columnWidths[index]);
    });

});
