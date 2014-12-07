"use strict";

angular.module('drummachine').factory "Composition", (compositionService) ->
  (data) ->
    id:       data.id
    name:     data.name
    patterns: []
    save: ->
      compositionService.save @
