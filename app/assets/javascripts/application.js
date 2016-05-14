// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require turbolinks
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require Chart
//= require_tree .


function toggle(d) {
  if (document.getElementById(d).style.display == "none") {
    document.getElementById(d).style.display = "block";
  } else {
    document.getElementById(d).style.display = "none";
  }
}

function review_switch(_to, _from) {
  if (document.getElementById(_to).style.display == "none") {
    document.getElementById(_to).style.display = "block";
    document.getElementById(_from).style.display = "none";
  }
}

$.ajaxSetup({
    statusCode: {
        401: function () {
            window.location.href = '/users/auth/google_oauth2';
        }
    }
});

// $.rails.allowAction = function confirmBox(element) {
//     var message = element.data('confirm');
//     if (message == '') {
//       return true;
//     } else {
//       var $link = element.clone().removeAttr('class')
//       .removeAttr('data-confirm').removeAttr('value').addClass('btn')
//       .addClass('btn-danger').addValue('delete')
//       .addClass('confirmBtn').html("Yes, I'm completely certain.");
//
//       var modal_html = "<div class='modal fade' id='myModal' role='dialog'><div class='modal-content'><div class='modal-header'><a class='close' data-dismiss='modal'>×</a><h3 class='modal-title' id='deleteMessage'>" + message + "</h3></div><div class='modal-footer'><a data-dismiss='modal' class='btn btn-primary'>Cancel</a></div></div></div>";
//       var $modal_html = $(modal_html);
//       $modal_html.find('.modal-footer').append($link);
//       $modal_html.modal();
//       return false;
//     }
// };
