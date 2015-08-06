# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
) jQuery

$ -> 
  $('#timer').pietimer {
    seconds: 10
    color: 'rgba(200, 200, 200, 0.8)'
  }, ->
    console.log("done")
  $('#timer').pietimer('start')

$(document).on "change", ".imgcheck", ->
  if @checked
    console.log("checked")
    $(this).parents('.thumbnail').css( "border-color", "#f00")
  else
    console.log("unchecked")
    $(this).parents('.thumbnail').css( "border-color", "#ddd")
