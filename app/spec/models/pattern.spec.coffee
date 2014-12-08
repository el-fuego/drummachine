"use strict";
describe 'Pattern model', () ->
  Pattern = null
  Track = null
  beforeEach module('drummachine')
  beforeEach inject (_Pattern_, _Track_) ->
    Pattern = _Pattern_
    Track = _Track_

  it 'has "bpm" attribute with initialization value', ->
    pattern = new Pattern bpm: 140
    expect(pattern.bpm).toBe 140

  it 'has "loopCount" attribute with initialization value', ->
    pattern = new Pattern loopCount: 2
    expect(pattern.loopCount).toBe 2

  it 'has "noteBit" attribute with initialization value', ->
    pattern = new Pattern noteBit: 3
    expect(pattern.noteBit).toBe 3

  it 'has "noteValue" attribute with initialization value', ->
    pattern = new Pattern noteValue: 4
    expect(pattern.noteValue).toBe 4

  it 'has empty tracks list after initialization', ->
    pattern = new Pattern()
    expect(pattern.tracks).toEqual []

  it 'has tracks if passed on initialization', ->
    tracksData = [
      {instrument: {id: 1}},
      {instrument: {id: 2}}
    ]

    tracks = _.map tracksData, (data) ->
      new Track data

    pattern = new Pattern tracks: tracksData
    expect(pattern.tracks).toEqual tracks