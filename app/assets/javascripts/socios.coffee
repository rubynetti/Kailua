# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  $('#filter').focus()
  $('#filter').keyup ->
    rex = new RegExp($(this).val(), 'i')
    $('.searchable tr').hide()
    $('.searchable tr').filter(->
      rex.test $(this).text()
    ).show()

    return
