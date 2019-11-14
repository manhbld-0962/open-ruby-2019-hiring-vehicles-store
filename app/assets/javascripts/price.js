$(document).ready(function () {
  $('#hiring-time').on("change", function() {
    var total = parseInt($('#vehicle-price').html())*parseInt($('#hiring-time').val());
    $('#total').html(total)
  });
})
