"use strict";
describe 'Composition model', () ->
  Composition = null
  Pattern = null
  compositionService = null
  beforeEach module('drummachine')

  beforeEach inject (_Composition_, _Pattern_, _compositionService_) ->
    Composition = _Composition_
    Pattern = _Pattern_
    compositionService = _compositionService_

  it 'has "id" attribute with initialization value', ->
    composition = new Composition id: 1

    expect(composition.id).toBe 1

  it 'has "name" attribute with initialization value', ->
    composition = new Composition name: 'first'

    expect(composition.name).toBe 'first'

#  it 'call compositionService with them on save', ->
#    compositionServiceCall = jasmine.createSpy('compositionServiceCall');
#
#    composition = new Composition()
#    spyOn(compositionService, 'save')
#    composition.save()
#    expect(compositionService.save).toHaveBeenCalledWithArguments composition

  it 'has empty patterns list after initialization', ->
    composition = new Composition()
    expect(composition.patterns).toEqual []

  it 'has patterns if passed on initialization', ->
    patternsData = [
      {bpm: 140},
      {npm: 160}
    ]

    patterns = _.map patternsData, (data) ->
      new Pattern data

    composition = new Composition patterns: patternsData
    expect(composition.patterns).toEqual patterns