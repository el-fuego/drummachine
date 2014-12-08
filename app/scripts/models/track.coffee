"use strict";

angular.module('drummachine').factory "Track", (Note) ->
  class Track
    constructor: (data) ->
      this.instrument = data?.instrument
      this.notes      = _.map(data?.notes || [], (data) -> new Note data)
