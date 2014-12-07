(function() {
  "use strict";
  describe('audio service', function() {
    var audio, getAudio;
    beforeEach(module('drummachine'));
    audio = null;
    getAudio = function() {
      return inject(function(_audio_) {
        return audio = _audio_;
      });
    };
    beforeEach(getAudio());
    return it('should unlock audio context in 20 miliseconds', function() {
      return expect(audio.unlock).toBeDefined();
    });
  });

}).call(this);
