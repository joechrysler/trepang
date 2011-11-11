$(document).ready(function() {
  $('.step_file span, .scenario_file').each(function(index, item) {
    var item = $(item);
    item.html('<a href="' + item.html() + '">' + item.html() + '</a>');
  });

  var modal = $('<div id="modal"><textarea id="edit" rows="20"></textarea></div>');
  $('body').append(modal);
});
