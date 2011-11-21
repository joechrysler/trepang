$(document).ready(function() {
  var button = $('<button id="done">Close</button>');
  var modal = $('<div id="modal"><textarea id="edit" rows="20"></textarea></div>');
  modal.append(button);

  button.click(function() {
    modal.slideUp();
  });

  modal.hide();
  $('body').append(modal);

  $('.step_file span, .scenario_file').each(function(index, item) {
    var item = $(item);
    var anchor = $('<a>' + item.html() + '</a>');
    item.html(anchor);

    anchor.click(function() {
      modal.slideDown();
    });
  });
});
