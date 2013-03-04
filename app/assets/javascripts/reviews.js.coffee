# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.review-star').click (e) ->
    e.preventDefault()
    $(@).find('i').toggleClass('icon-star-empty').toggleClass('icon-star')
    $(@).prevAll().find('i').removeClass('icon-star-empty').addClass('icon-star')
    $(@).nextAll().find('i').addClass('icon-star-empty').removeClass('icon-star')
    value = $(@).data('value')
    value = value + 1 if $(@).find('i').hasClass('icon-star')
    $(@).siblings('input').val(value)
    console.log value