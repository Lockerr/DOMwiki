# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).on "mercury:ready", ->
  link = $("#edit_link")
  Mercury.saveUrl = link.data("save-url")
  console.log 'ready!'
  console.log link.data("save-url")
  console.log window.location.href

$(window).on "mercury:saved", ->
  console.log "location is #{window.location.pathname}"
  loc = window.location.pathname
  window.location = loc
  console.log window.location.href
  window.location = loc.replace(/\/editor\//i, '/')
  alert loc
  console.log 'saved'
      
