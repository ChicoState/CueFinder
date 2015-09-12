# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
) jQuery

###   on document load   ###
ready = -> 
  
  start_of_selections()

  count = 0

  ###   start pietime   ###
  $('#timer').pietimer {
    seconds: 10
    color: 'rgba(200, 200, 200, 0.8)'
  }, done
  $('#timer').pietimer('start')

  ###   change selection color   ###
  $(document).on "change", ".imgcheck", ->
    event.preventDefault()

    id = $(this).attr('id')

    time = new Date().toISOString().slice(0, 19).replace('T', ' ');

    row = id.charAt(0)
    col = id.charAt(1)

    $.ajax
      url: "/SelectionCreate/?row="+row+"&column="+col+"&local_time="+time
      type: "post"
      success: ->
        console.log 'success'
        return
      error: ->
        console.log 'error'
        return

    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")

  ###   create selection   ###
  $('#next_button').click (event) ->
    event.preventDefault()
    done()
    return

done = ->

  $.ajax
    url: "/NextQuestion"
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return
  return

start_of_selections = ->

  $.ajax
    url: "/SelectionStart"
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return
  return

$(document).ready ready
$(document).on 'page:load', ready
