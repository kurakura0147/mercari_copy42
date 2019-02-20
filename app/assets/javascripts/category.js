$(document).on('turbolinks:load', function() {

  $(document).on('change', '.select-category', function() {
    var template = $(`#category${$(this).val()}`);
    $(this).parent().append(template.html());
  });

  $(document).on('change', '.medium_categories', function() {
    var template = $(`#category${$(this).val()}`);
    $(this).parent().append(template.html());
  });

});
