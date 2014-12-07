"use strict";
describe 'compositionService', () ->
  compositionService = null
  compositionsUrl = null
  $httpBackend = null

  compositionData = {id: 1, name: 'test'}

  beforeEach module('drummachine')
  beforeEach inject (_compositionService_, _compositionsUrl_, $injector) ->
    compositionService = _compositionService_
    compositionsUrl = _compositionsUrl_

    $httpBackend = $injector.get('$httpBackend')
    $httpBackend.whenGET("#{compositionsUrl}/1").respond(200, compositionData)
    $httpBackend.whenPOST("#{compositionsUrl}/1").respond(200, compositionData)


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe 'get composition', ->
    it 'send request', ->
      $httpBackend.expectGET("#{compositionsUrl}/1")
      compositionService.get(1)
      $httpBackend.flush()

    it 'get data', ->
      receiveResponce = jasmine.createSpy('receiveResponce');

      compositionService.get(1).then (data)->
        receiveResponce()
        expect(data).toEqual(compositionData);
      $httpBackend.flush()

      expect(receiveResponce).toHaveBeenCalled()


  describe 'save composition', ->
    it 'send request', ->
      $httpBackend.expectPOST("#{compositionsUrl}/1")
      compositionService.save(compositionData)
      $httpBackend.flush()

    it 'get saved data', ->
      receiveResponce = jasmine.createSpy('receiveResponce');

      compositionService.save(compositionData).then (data)->
        receiveResponce()
        expect(data).toEqual(compositionData);
      $httpBackend.flush()

      expect(receiveResponce).toHaveBeenCalled()

