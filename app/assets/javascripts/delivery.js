$(document).on('turbolinks:load', function() {

  var sellerFee = `<option value="未定">未定</option>
                  <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                  <option value="ゆうメール">ゆうメール</option>
                  <option value="レターパック">レターパック</option>
                  <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="クリックポスト">クリックポスト</option>
                  <option value="ゆうパケット">ゆうパケット</option>
                  `

  var buyerFee = `<option value="未定">未定</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="ゆうメール">ゆうメール</option>
                  `

  $('.delivery__box').hide();

  $(document).on('change', '.delivery__box-cost', function() {
    $('.delivery__box').show();
    var text = $('.delivery__box-cost option:selected').text();
    if(text === '送料込み(出品者持ち)') {
      $('.delivery__option').append(sellerFee);
    } else {
      $('.delivery__option').append(buyerFee);
    }
  })

})
