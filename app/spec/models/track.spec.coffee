"use strict";
describe 'Track model', () ->
  Track = null
  Note = null
  beforeEach module('drummachine')
  beforeEach inject (_Track_, _Note_) ->
    Track = _Track_
    Note = _Note_

  it 'has "instrument" attribute with initialization value', ->
    firstInstrument = {id: 'first'}

    track = new Track instrument: firstInstrument

    expect(track.instrument).toEqual firstInstrument

  it 'has empty notes list after initialization', ->
    track = new Track()
    expect(track.notes).toEqual []

  it 'has notes if passed on initialization', ->
    notesData = [
      {value: 2, volume: 0.5},
      {value: 8, volume: 1}
    ]

    notes = _.map notesData, (data) ->
      new Note data

    track = new Track notes: notesData
    expect(track.notes).toEqual notes