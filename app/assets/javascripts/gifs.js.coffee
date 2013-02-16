# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#gif_title').change -> $('.preview .title').html( $('#gif_title').val() )
  $('#gif_url').change -> $('.preview img').attr('src', $('#gif_url').val() )