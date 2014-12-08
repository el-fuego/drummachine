"use strict";

angular.module('drummachine').factory "Composition", (compositionService, Pattern) ->
  class Composition
    constructor: (data) ->
      this.id =       data?.id
      this.name =     data?.name
      this.patterns = _.map(data?.patterns || [], (data) -> new Pattern data)
    save: ->
      compositionService.save @
