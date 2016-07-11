function coursePage () {
  return (window.location.href.split('/')[3] !== null
    && window.location.href.split('/')[3] === 'courses')
}

function schoolInitials () {
  school = 'HM'
  if (coursePage()) {
    course = window.location.href.split('/').pop().split('#')[0]
    school = course.substring(course.length-2, course.length)
    return school
  }
  return school
}

function setSchoolColor (item) {
  var school = schoolInitials()
  if (school === 'CM') {
    item.removeClass('yellow darken-3').addClass('pink darken-4')
  } else if (school === 'PO') {
    item.removeClass('yellow darken-3').addClass('blue darken-4')
  } else if (school === 'PZ') {
    item.removeClass('yellow darken-3').addClass('orange')
  } else if (school === 'SC') {
    item.removeClass('yellow darken-3').addClass('green darken-4')
  }
}

function setSchoolTextColor (item) {
  var school = schoolInitials()
  if (school === 'CM') {
    item.addClass('pink-text text-darken-4')
  } else if (school === 'HM') {
    item.addClass('yellow-text text-darken-3')
  } else if (school === 'PO') {
    item.addClass('blue-text text-darken-4')
  } else if (school === 'PZ') {
    item.addClass('orange-text')
  } else if (school === 'SC') {
    item.addClass('green-text text-darken-4')
  } else {
    item.addClass('yellow-text text-darken-3')
  }
}

function schoolColor () {
  var color = '#f9a825'
  if (coursePage) {
    school = schoolInitials()
    if (school === 'CM') {
      color = '#880e4f'
    } else if (school === 'HM') {
      color = '#f9a825'
    } else if (school === 'PO') {
      color = '#0d47a1'
    } else if (school === 'PZ') {
      color = '#ff9800'
    } else if (school === 'SC') {
      color = '#1b5e20'
    }
  }
  return color
}

function convertHex (hex, opacity)  {
  hex = hex.replace('#', '')
  r = parseInt(hex.substring(0, 2), 16)
  g = parseInt(hex.substring(2, 4), 16)
  b = parseInt(hex.substring(4, 6), 16)

  result = 'rgba(' + r + ',' + g + ',' + b + ',' + opacity/100 + ')'
  return result
}

var ready
ready = function () {
  setSchoolColor($('nav'))
  $('.school-color').each(function () {
    setSchoolTextColor($(this))
  })
  $('ul li span').each(function () {
    setSchoolTextColor($(this))
  })
  $('<style>.col input:focus { border-bottom: 1px solid ' + schoolColor() + ' !important; box-shadow: 0 1px 0 0' + schoolColor() + ' !important; }</style>').appendTo('head')
  $('<style>.col textarea:focus { border-bottom: 1px solid ' + schoolColor() + ' !important; box-shadow: 0 1px 0 0' + schoolColor() + ' !important; }</style>').appendTo('head')
}
$(document).ready(ready)
$(document).on('page:load', ready)

function updateSchoolColors () {
  $('.school-color').each(function () {
    $(this).css('color', schoolColor())
  })
}
