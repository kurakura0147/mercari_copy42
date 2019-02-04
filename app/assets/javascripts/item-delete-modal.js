$(document).on('turbolinks:load', function() {

  $('.item--change__box--delete').click(function() {
    $('.modal').fadeIn('slow');
  });

  $('.modal__cancel').click(function() {
    $('.modal').fadeOut('slow');
  });
});
