"use strict";

angular.module("drummachine").factory "audio", ->
  AudioContext = window.AudioContext or window.webkitAudioContext
  context = new AudioContext()
  isUnlocked = false

  unlock = ->
    buffer = context.createBuffer(1, 1, 22050)
    source = context.createBufferSource()
    source.buffer = buffer
    source.connect context.destination
    source.start ||= source.noteOn 0
    
    # by checking the play state after some time, we know if we're really unlocked
    window.setTimeout (->
      isUnlocked = true  if source.playbackState is source.PLAYING_STATE or source.playbackState is source.FINISHED_STATE
      window.removeEventListener 'touchstart', unlock, true 
    ), 10

  window.addEventListener 'touchstart', unlock, true

  context: context
  isUnlocked: isUnlocked
  unlock: unlock
