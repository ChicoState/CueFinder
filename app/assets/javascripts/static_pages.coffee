# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
) jQuery

###   on document load   ###
$ -> 

  count = 0

  ###   start pietime   ###
  $('#timer').pietimer {
    seconds: 10
    color: 'rgba(200, 200, 200, 0.8)'
  }, ->
    console.log("done")
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
  $('#picture_submit').click (event) ->

    event.preventDefault()

    row = 4
    col = 2
    user_id = 105
    finder_id = 1
    item_id = 1

    $.ajax
      url: "/SelectionCreate/?item_id="+item_id+"&finder_id="+finder_id+"&user_id="+user_id+"&row="+row+"&column="+col
      type: "post"
      success: ->
        console.log 'success'
        return
      error: ->
        console.log 'error'
        return
    return


