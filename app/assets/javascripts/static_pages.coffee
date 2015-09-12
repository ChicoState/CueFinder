# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
) jQuery

###   on document load   ###
ready = -> 

  timer = 20

  ###   start pietime   ###
  $('#timer').pietimer {
    seconds: timer
    color: 'rgba(200, 200, 200, 0.8)'
  }, done
  $('#timer').pietimer('start')

  ###   change selection color   ###
  $(document).on "change", ".imgcheck", ->
    event.preventDefault()

    id = $(this).attr('id')

    row = id.charAt(0)
    col = id.charAt(1)

    $.ajax
      url: "/SelectionCreate/?row="+row+"&column="+col
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

$(document).ready ready
$(document).on 'page:load', ready
