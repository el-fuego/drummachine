"use strict";

angular.module('drummachine').factory "Composition", (compositionService, Pattern) ->
  (data) ->
    id:       data.id
    name:     data.name
    patterns: _.map(data.patterns || [], (data) -> new Pattern data)
    save: ->
      compositionService.save @
