$(document).ready(function() {

var pages = $('.section');
pages.hide();
pages.eq(0).fadeIn();

  $('.next-step').click(function(e) {
    e.preventDefault();
    pages.hide();
    pages.eq(1).fadeIn();
  });

  $('.next-step2').click(function(e) {
    e.preventDefault();
    pages.hide();
    pages.eq(2).fadeIn();
  })

  $('.next-step3').click(function(e) {
    e.preventDefault();
    pages.hide();
    pages.eq(3).fadeIn();
  })

  $('.next-step4').click(function (e) {
    e.preventDefault();
    pages.hide();
    pages.eq(4).fadeIn();
  })
});
