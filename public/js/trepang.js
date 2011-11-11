$(document).ready(function() {
  $('.step_file span, .scenario_file').each(function(index, item) {
    var item = $(item);
    item.html('<a href="' + item.html() + '">' + item.html() + '</a>');
  });
});
