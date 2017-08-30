# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Configure infinite table
  $('.infinite-table').infinitePages
    # debug: true
    debug: true
    buffer: 100 # load new page when within 200px of nav link
    context: '.container'
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')