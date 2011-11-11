$(document).ready(function() {
  console.log('here');
  var step_file = $('.step_file span, .scenario_file');
  step_file.html("<a href='" + step_file.html() + "'>" + step_file.html() + "</a>");
});
