var ready
ready = function () {
  $('.main-search').bind('railsAutocomplete.select', function (event, data) {
    var space = ' '
    var re = new RegExp(space, 'g')
    var course = data.item.code.replace(re, '_')
    window.location.href = '/courses/' + course
  })
  $('#header-search').bind('railsAutocomplete.select', function (event, data) {
    var space = ' '
    var re = new RegExp(space, 'g')
    var course = data.item.code.replace(re, '_')
    window.location.href = '/courses/' + course
  })
  $('#nav-search').bind('railsAutocomplete.select', function (event, data) {
    var space = ' '
    var re = new RegExp(space, 'g')
    var course = data.item.code.replace(re, '_')
    window.location.href = '/courses/' + course
  })
  $('input[data-autocomplete][autofocus]').focus()
}
$(document).ready(ready)
$(document).on('page:load', ready)
