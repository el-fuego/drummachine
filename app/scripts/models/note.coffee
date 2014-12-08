"use strict";

angular.module('drummachine').factory "Note", ->
  class Note
    constructor: (data) ->
      this.value =   data?.value
      this.volume =  data?.volume
    isPause: ->
      @volume == 0
