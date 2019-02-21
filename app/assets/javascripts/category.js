$(document).on('turbolinks:load', function() {

  $(document).on('change', '.select-category', function(event, template) {
    var template = $(`#category${$(this).val()}`);
    $(this).nextAll().remove();
    $(this).parent().append(template.html());
  });

  $(document).on('change', '.medium_categories', function(event, template) {
    var template = $(`#category${$(this).val()}`);
    $(this).nextAll().remove();
    $(this).parent().append(template.html());
  });

});
