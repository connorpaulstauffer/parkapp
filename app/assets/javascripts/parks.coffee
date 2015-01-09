# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# get JSON object
# on success, parse it and
# hand it over to MapBox for mapping

$.ajax
  dataType: 'text'
  url: 'parks.json'
  success: (data) ->
    geojson = $.parseJSON(data)
    map.featureLayer.setGeoJSON(geojson)
