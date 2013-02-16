# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#gif_title').keyup -> $('.preview .title').html( $('#gif_title').val() )
  $('#gif_url').keyup -> $('.preview img').attr('src', $('#gif_url').val() )

  $('#q.search-query').keyup (event) -> 
    if (event == 13)
      $.ajax
        url: "/"
        data: { q: $('#q.search-query').val() }
        error: alert "A great disturbance in the force I feel"