"use strict";
describe 'Note model', () ->
  Note = null
  beforeEach module('drummachine')
  beforeEach inject (_Note_) ->
    Note = _Note_

  it 'has "value" attribute with initialization value', ->
    note = new Note value: 2
    expect(note.value).toBe 2

  it 'has "volume" attribute with initialization value', ->
    note = new Note volume: 0.5
    expect(note.volume).toBe 0.5

  it 'has isPause if volume is 0', ->
    note = new Note volume: 0
    expect(note.isPause()).toBeTruthy()

  it 'has isPause if volume > 0', ->
    note = new Note volume: 0.5
    expect(note.isPause()).toBeFalsy()
