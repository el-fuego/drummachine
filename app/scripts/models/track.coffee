"use strict";

angular.module('drummachine').factory "Track", (Note) ->
  (data) ->
    instrument: data.instrument
    notes:    _.map(data.notes || [], (data) -> new Note data)
