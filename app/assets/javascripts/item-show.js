$(document).on('turbolinks:load', function() {
  $(function(){
    $("img#sub-image").hover(function(){
      var ImgSrc = $(this).attr("src");
      var ImgAlt = $(this).attr("alt");
      $(" img#main-image ").attr({src:ImgSrc,alt:ImgAlt});
      // $(" img#main-image ").hide();
      $(" img#main-image ").fadeIn(3000);
    });
  });
});
