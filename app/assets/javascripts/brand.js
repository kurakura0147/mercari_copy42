$(document).on('turbolinks:load', function() {

  $('.brand__box').hide();
  $('.brand__box__suggest').hide();
  $(document).on('change', '.small_categories', function() {
    $('.brand__box').show();
  });

  var searchBrand = $('.brand__box__suggest--list');
  var addBrand = $('.brand__box--input');
  function appendBrand(data) {
    var html = `<li><a class="brand__add", data-brand-id="${ data.id }", data-brand-name=${ data.name }>${ data.name }</a></li>`
    searchBrand.append(html);
  }

  function appendNoBrand(data) {
    var html = `<li>${ data }</li>`
    searchBrand.append(html);
  }

  function addBrandId(brandId) {
    var html = `<input name="item[brand_id]", type="hidden" value="${ brandId }">`
    addBrand.append(html);
  }

  $(document).on('keyup', '.brand__box--input', function() {
    var input = $('.brand__box--input').val();
    $('.brand__box__suggest').show();

    $.ajax({
      type: 'GET',
      url: '/items/search_brand',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(data) {
      $('.brand__box__suggest--list').empty()
      if (data.length !== 0) {
        data.forEach(function(data) {
          appendBrand(data);
        })
      } else {
        appendNoBrand('一致するブランドはありません');
      }
    })
    .fail(function() {
      alert('ちょっと検索できないわ')
    });
  });

  $(document).on('click', '.brand__add', function() {
    var brandId = $(this).data('brand-id');
    var brandName = $(this).data('brand-name');
    addBrandId(brandId);
    $('.brand__box--input').val(brandName);

  });

});
