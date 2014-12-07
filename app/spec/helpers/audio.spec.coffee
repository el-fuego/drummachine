"use strict";
describe 'audio service', () ->
  beforeEach module('drummachine')
  audio = null
  getAudio = ->
    inject (_audio_) ->
      audio = _audio_

  beforeEach getAudio()

  it 'should unlock audio context in 20 miliseconds', () ->
    expect(audio.unlock).toBeDefined()
