"use strict";

angular.module('drummachine').factory "Pattern", (Track) ->
  (data) ->
    bpm:       data.bpm
    loopCount: data.loopCount
    noteBit:   data.noteBit
    noteValue: data.noteValue
    tracks:    _.map(data.tracks || [], (data) -> new Track data)
