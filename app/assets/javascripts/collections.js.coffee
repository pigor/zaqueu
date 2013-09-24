# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.fn.datetimepicker.defaults = {
  maskInput: true,
  pickDate: true,
  pickTime: true,
  pick12HourFormat: false,
  pickSeconds: false,
  startDate: -Infinity,
  endDate: Infinity,
  collapse: true
};
$('#deadline-field').datetimepicker => language: 'pt-BR'
