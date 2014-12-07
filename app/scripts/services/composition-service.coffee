"use strict";
angular.module('drummachine').constant 'compositionsUrl', '/compositions'

angular.module('drummachine').factory "compositionService", ($http, compositionsUrl) ->
  get: (id) ->
    $http.get("#{compositionsUrl}/#{id}").then (res) ->
      res.data

  save: (composition) ->
    $http.post("#{compositionsUrl}/#{composition.id}").then (res) ->
      res.data