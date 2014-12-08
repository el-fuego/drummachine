"use strict";

angular.module('drummachine').factory "Pattern", (Track) ->
  class  Pattern
    constructor: (data) ->
      this.bpm =       data?.bpm
      this.loopCount = data?.loopCount
      this.noteBit  =  data?.noteBit
      this.noteValue = data?.noteValue
      this.tracks =    _.map(data?.tracks || [], (data) -> new Track data)
