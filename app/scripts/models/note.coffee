"use strict";

angular.module('drummachine').factory "Note", ->
  (data) ->
    value:   data.value
    volume:  data.volume
    isPause: ->
      data.volume == 0
