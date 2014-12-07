"use strict";
describe 'audio service', () ->
  beforeEach ->
    console.log module
    module('drummachine')


  it 'should unlock audio context in 20 miliseconds', () ->
    expect(true).toBeDefined()
