$(document).ready(function() {
  var modal = $('<div id="modal"><textarea id="edit" rows="20"></textarea></div>');
  var buttons = $('<div class="buttons"></div>')
  modal.append(buttons);

  var cancel = $('<button class="cancel">Cancel</button>');
  buttons.append(cancel);
  cancel.click(function() {
    modal.slideUp();
  });

  var save = $('<button>Save</button>');
  buttons.append(save);

  var saveAndRerun = $('<button>Save & Rerun</button>');
  buttons.append(saveAndRerun);

  modal.hide();
  $('body').append(modal);

  $('.step_file span, .scenario_file').each(function(index, item) {
    var item = $(item);
    var anchor = $('<a>' + item.html() + '</a>');
    var filepath = item.html().split(':')[0];
    var lineNumber = item.html().split(':')[1];
    item.html(anchor);

    anchor.click(function() {
      $.ajax({
        url: '/file/' + filepath,
        data: {lineNumber: lineNumber},
        success: function (fileContent) {
          $('#edit').val(fileContent);
          modal.slideDown();

          save.click(function() {
            $.ajax({
              url: '/file/' + filepath,
              type: 'POST',
              data: {content: $('#edit').val()},
              success: function () {
                modal.slideUp();
              }
            });
          });

          saveAndRerun.click(function() {
            $.ajax({
              url: '/file/' + filepath,
              type: 'POST',
              data: {content: $('#edit').val()},
              success: function () {
                location.reload(true);
              }
            });
          });
        }
      });
    });
  });
});
