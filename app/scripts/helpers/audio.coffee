"use strict";

angular.module('drummachine').service "audio", () ->
  AudioContext = window.AudioContext or window.webkitAudioContext
  new AudioContext()
