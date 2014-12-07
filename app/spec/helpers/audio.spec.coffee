"use strict";
describe 'audio service', () ->
  audio = null
  beforeEach module('drummachine')
  beforeEach inject (_audio_) ->
    audio = _audio_

  it 'should unlock audio context in 20 miliseconds', () ->
    expect(audio.constructor).toBe(AudioContext)
