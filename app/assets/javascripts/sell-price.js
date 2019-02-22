$(document).on('turbolinks:load', function() {

  function update_field(input) {
      var price = $('.sell__price--input').val() * 0.9;
      var total = Math.round(price);
      $('#total').text("¥" + total);

      var result = $('.sell__price--input').val() * 0.1 ;
      var margin = Math.round(result);
      $('#margin').text("¥" + margin);
  };

  function no_field(){
    $('#total').text("-");
    $('#margin').text("-");
  };

  $('.sell__price--input').on('keyup change', function() {
    var input = $(this).val();
      if( input >= 300 && input <= 9999999 ) {
        update_field(input);
      } else {
        no_field();
      }
  });
});
