$(document).on('turbolinks:load', function() {

  var size = `<option value="XXS以下">XXS以下</option>
              <option value="XS(SS)">XS(SS)</option>
              <option value="S">S</option>
              <option value="M">M</option>
              <option value="L">L</option>
              <option value="XL(LL)">XL(LL)</option>
              <option value="2XL(3L)">2XL(3L)</option>
              <option value="3XL(4L)">3XL(4L)</option>
              <option value="4XL(5L)以上">4XL(5L)以上</option>
              <option value="FREE SIZE">FREE SIZE</option>`

  var shoeSize = `
              <option value="20cm以下">20cm以下</option>
              <option value="20.5cm">20.5cm</option>
              <option value="21cm">21cm</option>
              <option value="22cm">22cm</option>
              <option value="22.5cm">22.5cm</option>
              <option value="23cm">23cm</option>
              <option value="23.5cm">23.5cm</option>
              <option value="24cm">24cm</option>
              <option value="24.5cm">24.5cm</option>
              <option value="25cm">25cm</option>
              <option value="25.5cm">25.5cm</option>
              <option value="26cm">26cm</option>
              <option value="26.5cm">26.5cm</option>
              <option value="27cm">27cm</option>
              <option value="27.5cm以上">27.5cm</option>
              `

  $('.item_sizes').hide();
  $('.brand-box').hide();

    $(document).on('change', '.small_categories', function() {
    var text = $('.medium_categories option:selected').text();
    var val = $('.small_categories').val();

    if(text === '靴') {
      $('.item_sizes').show();
      $('.size-box').append(shoeSize);
    } else if(val < 470) {
      $('.item_sizes').show();
      $('.size-box').append(size);
    }
  })

});
