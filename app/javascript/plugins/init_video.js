let first_play = true
const video = document.getElementById("video");

video.onplay = function() {
  if (first_play) {
    console.log("The video has started to play");
    first_play = false
  }
};

const initVideo = () => {
  (function(window, videojs) {
  var player = window.player = videojs('video');
  }(window, window.videojs));
};

export { initVideo };
