$(document).ready(function() {
  $('button.run').click(function() {
    $.ajax({
      url: '/api/run',
      type: 'POST',
      success: function(results) {
        $('#results').html(results);
      }
    });
  });
});
