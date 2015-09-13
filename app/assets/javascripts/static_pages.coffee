# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
) jQuery

ready = -> 
  switch $('#page_type').data('type')
    when 'pictures' then pictures()
    when 'finder' then finder()
    when 'followup' then followup()
    when 'welcome' then welcome()
    else null

welcome = ->
  add_next_button()

finder = ->
  add_next_button()

pictures = ->
  add_next_button()

  ###   start pietime   ###
  $('#timer').pietimer {
    timer: 20,
    color: 'rgba(200, 200, 200, 0.8)'
  },done
  $('#timer').pietimer('start')

  ###   change selection color   ###
  $(document).on "change", ".imgcheck", ->
    event.preventDefault()
    id = $(this).attr('id')
    row = id.charAt(0)
    col = id.charAt(1)
    
    select(row,col)

    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")

followup = ->

#Adds click attribute to a button
add_next_button = ->
  $('#next_button').click (event) ->
    event.preventDefault()
    done()
    return

#Make a selection
select = (row, col) ->
  $.ajax
    url: "/SelectionCreate/?row="+row+"&column="+col
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return


#Request to go to next question
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
