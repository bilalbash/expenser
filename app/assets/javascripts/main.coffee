$.fn.extend
  animateCss: (animationName)->
    animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
    this.addClass('animated ' + animationName).one animationEnd, ->
      $(this).removeClass('animated ' + animationName)
    return this

document.addEventListener 'turbolinks:load', ->
  $('.selectpicker1').selectpicker('refresh')
  $('.selectpicker2').selectpicker('refresh')

  myDate = $('#datetimepicker')

  myDatePicker = myDate.datetimepicker(format: 'DD-MM-YYYY')

  $('input', '#datepickerEvent').on 'click', ->
    $('.glyphicon.glyphicon-calendar').click()

  $('.ajaxFormItems').on 'submit', (e)->
    e.stopPropagation()

  $('.avoidSubmit').on 'click', (e) ->
    e.stopPropagation()
    $('#collapseExample').collapse('toggle')

  myNewCategoryModal = '#myNewCategoryModal'
  errorDisplay = $('.alert.alert-danger', myNewCategoryModal)

  clearErrors = ->
    errorDisplay.hide()
    errorDisplay.find('ul').remove()

  clearErrors()
  $('a', myNewCategoryModal).on 'click', (e) ->

    if $(this).attr('type') == 'submit'
      e.stopPropagation()

      xhrtobj = $.post '/categories', $('form', myNewCategoryModal).serialize()
      xhrtobj.done (data)->
        console.log('success')

      xhrtobj.fail (data)->
        clearErrors()
        innerHtml = '<ul>'
        $.each $.parseJSON(data.responseText), (key, value)->
          innerHtml = innerHtml + "<li>#{key} #{value}</li>"
        innerHtml = innerHtml + '</ul>'
        errorDisplay.append(innerHtml)
        errorDisplay.show('slow')

  $(myNewCategoryModal).on 'hidden.bs.modal', ->
    clearErrors()

  # calculating the sum for Expense Column in any table
#  calculateSumFor = (expense_column)->

  sum = 0
  sumIndex = -1
  sumApplies = false
  tableLength = $('table tr').size()
  $.each $('table tr'), (index, row)->
    if index == 0
      console.log($('th', row).size())
      $.each $('th', row), (index, th)->
        if $(th).html() == 'Expense'
          console.log('it is sum able')
          sumApplies = true
          sumIndex = index

    else if sumApplies == true && index < (tableLength - 1)
      $.each $('td', row), (index, td)->
        if index == sumIndex
          sum = sum + parseInt($(td).html())

    else if index == (tableLength - 1)
      $.each $('th', row), (index, th)->
        if index == sumIndex
          $(th).html(sum)
