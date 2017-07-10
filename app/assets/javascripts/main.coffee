document.addEventListener 'turbolinks:load', () ->
  $('.selectpicker1').selectpicker('refresh')
  $('.selectpicker2').selectpicker('refresh')

  myDate = $('#datetimepicker')

  myDatePicker = myDate.datetimepicker(format: 'DD-MM-YYYY')

  $('input', '#datepickerEvent').on 'click', ()->
    $('.glyphicon.glyphicon-calendar').click()


  console.log('im dsadas')
  $('.ajaxFormItems').on 'submit', (e)->
    e.stopPropagation()
    console.log('im changed')