# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#deadline-field').datetimepicker
  locale: 'pt-br',
  format: 'DD/MM/YYYY HH:mm',
  minDate: new Date()
