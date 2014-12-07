(function() {
  "use strict";
  describe('audio service', function() {
    var audio;
    audio = null;
    beforeEach(module('drummachine'));
    beforeEach(inject(function(_audio_) {
      return audio = _audio_;
    }));
    beforeEach(function() {
      return jasmine.clock().install();
    });
    return it('should unlock audio context in 20 miliseconds', function() {
      audio.unlock();
      expect(audio.isUnlocked).toBe(false);
      jasmine.clock().tick(20);
      return expect(audio.isUnlocked).toBe(true);
    });
  });

}).call(this);
