# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# get JSON object
# on success, parse it and
# hand it over to MapBox for mapping

$ = jQuery

$ ->
  for park in $(".park")
    $park = $(park)
    lat = $park.data("latitude")
    lon = $park.data("longitude")
    name = $park.data("name")
    state = $park.data("state")
    marker = L.marker([lat, lon]).addTo(map)
    marker.bindPopup("<b>#{name}</b><br>#{state}")
    
