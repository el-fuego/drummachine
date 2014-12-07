"use strict";
describe 'audio service', () ->
  audio = null
  beforeEach module('drummachine')
  beforeEach inject (_audio_) ->
    audio = _audio_

    sss = 2

  beforeEach ->
    jasmine.clock().install()

  it 'should unlock audio context in 20 miliseconds', () ->
    audio.unlock()
    expect(audio.isUnlocked).toBe(false)
    jasmine.clock().tick(20)
    expect(audio.isUnlocked).toBe(true)
