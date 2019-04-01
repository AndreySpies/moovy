const initVideo = () => {
  if (document.getElementById('video-title')) {
    (function(window, videojs) {
      var player = window.player = videojs('video');
    }(window, window.videojs));
  }
};

export { initVideo };
