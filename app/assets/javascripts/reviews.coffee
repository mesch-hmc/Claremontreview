# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link)
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click')

$.rails.showConfirmDialog = (link) ->
  info = (link.attr 'data-confirm').split '|'
  message = info[0]
  review = info[1]
  html = """
         <div class='modal fade' id='myModal' role='dialog'>
          <div class='modal-content'>
           <div class='modal-header'>
            <a class='close' data-dismiss='modal'>&times;</a>
            <h3 class='modal-title' id='deleteMessage'>#{message}</h3>
           </div>
           <div class='modal-footer'>
            <a data-dismiss='modal' class='btn btn-primary'>Cancel</a>
            <a data-dismiss="modal" class="btn btn-danger confirm confirmBtn" rel="nofollow" data-method="delete" href="#{review}">Yes, I'm completely certain.</a>
           </div>
          </div>
         </div>
         """
  $(html).modal()
  $('#myModal .confirm').on 'click', -> $.rails.confirmed(link)
