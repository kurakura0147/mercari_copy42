$(document).on('turbolinks:load', function() {

  $('.main-item-content__button-sold').hide();

  if(document.querySelector(".main-item-content__profile--sold")){
    $('.main-item-content__button').hide();
    $('.main-item-content__button-sold').show();
  } else {
    console.log("ちょっとむり")
  }



});
