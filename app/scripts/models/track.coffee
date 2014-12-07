"use strict";

angular.module('drummachine').factory "Track", ->
  (data) ->
    instrument: data.instrument
    notes:      []
