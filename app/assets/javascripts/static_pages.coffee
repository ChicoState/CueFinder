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
  start_of_selections()

  if !$('finder_options').data('noneenabled')
    remove_none_button()

  add_next_button()
  toggle_next_button()

  ###   start pietime   ###
  if $('#finder_options').data('timed')
    $('#timer').pietimer {
      timer: 20,
      color: 'rgba(200, 200, 200, 0.8)'
    },done
    $('#timer').pietimer('start')

  ###   make a selection   ###

  $(document).on "change", ".imgcheck", ->
    event.preventDefault()
    id = $(this).attr('id')
    row = id.charAt(0)
    col = id.charAt(1)

    if $('finder_options').data('multiplechoice')
      multiple_choice(row, col)
    else
      single_choice(this)

    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")

    toggle_next_button()

followup = ->

#remove the none button
remove_none_button = -> 
  $('#none').remove()
  return

#enables next button if a selection is made
toggle_next_button = ->
  if $(':checked').length == 0
    $('#next_button').prop('disabled', true)
  else
    $('#next_button').prop('disabled', false)

#Adds click attribute to a button
add_next_button = ->
  $('#next_button').click (event) ->
    event.preventDefault()
    done()
    return

#Single choice
single_choice = (selected) ->
  $(':checked').each ->
    if !($(selected).attr('id') == $(this).attr('id'))
      $(this).prop("checked", false)
    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")
    return


#Multiple choice
multiple_choice = (row, col) ->
  if @checked
    $(this).parents('.thumbnail').css( "border-color", "#f00")
  else
    $(this).parents('.thumbnail').css( "border-color", "#ddd")
  select(row,col)

#Make a selection
select = (row, col) ->
  time = new Date().toISOString().slice(0, 19).replace('T', ' ')
  $.ajax
    url: "/SelectionCreate/?row="+row+"&column="+col+"&local_time="+time
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return


#Request to go to next question
done = ->
  if !($('finder_options').data('multiplechoice'))
    $(':checked').each ->
      id = $(this).attr('id')
      row = id.charAt(0)
      col = id.charAt(1)
      select(row,col)

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
