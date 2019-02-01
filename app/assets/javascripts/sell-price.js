function update_field(){
    var result = $('#quantity').val() * 0.9 ;
    var total = Math.round(result);
    $('#total').text("¥" + total);
    var result = $('#quantity').val() * 0.1 ;
    var margin = Math.round(result);
    $('#margin').text("¥" + margin);
}

function no_field(){
  $('#total').text("-");
  $('#margin').text("-");
}

$(function(){
  $('input[value=""]').on('keyup change', function(){
    var min = $(this).val();

      if( min >= 300 && min <= 9999999){
        update_field();
      }else {
        no_field();
      }
  });
});
