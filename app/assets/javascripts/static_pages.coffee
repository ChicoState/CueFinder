# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->

) jQuery

$ -> 
  console.log("Dom is ready")

$(document).on "change", ".imgcheck", ->
  if @checked
    console.log("checked")
    $(this).parents('.thumbnail').css( "border-color", "#f00")
  else
    console.log("unchecked")
    $(this).parents('.thumbnail').css( "border-color", "#ddd")
 
