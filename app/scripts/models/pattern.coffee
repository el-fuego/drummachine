"use strict";

angular.module('drummachine').factory "Pattern", ->
  (data) ->
    bpm:       data.bpm
    loopCount: data.loopCount
    noteBit:   data.noteBit
    noteValue: data.noteValue
    tracks:    []
