# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#search").keydown (event) -> (
  if(event.keyCode == 13) 
    event.preventDefault();
    return false;
)

$("#search").keyup -> (
  $.ajax '/search/lookup?q=' + $('#search').val(),
    type: 'GET'
    dataType: 'html'
    error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      lines = ""
      for d in JSON.parse(data).options
        lines += "<li data-name='" + d.title + 
        "' data-description='" + d.description +
        "' data-image='" + d.image + "' class='result linky'>" + d.title + "</li>"
      $('#results').html(lines);
      $(".result").click (link) ->
        $("#asset_name").val($( this ).data("name"))
        $("#asset_description").val($( this ).data("description"))
        $("#asset_thumbnail").val($( this ).data("image"))

        
)