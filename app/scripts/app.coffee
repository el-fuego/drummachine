
@app = angular.module('drummachine', []).run (audio) ->
  audio.unlock()
