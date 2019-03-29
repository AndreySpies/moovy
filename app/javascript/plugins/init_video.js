if (document.getElementById('video-title')) {
  let first_play = true
  const video = document.getElementById("video");

  video.onplay = function() {
    if (first_play) {
      first_play = false
      increaseViews();
    }
  };
}

const increaseViews = () => {
  const videoId = document.getElementById('video-title').getAttribute("data-video");
  Rails.ajax({
    url: `/videos/views/${videoId}`,
    type: "PATCH",
    data: `video[views]=1`,
    dataType : "text"
  });
};

const initVideo = () => {
  if (document.getElementById('video-title')) {
    (function(window, videojs) {
      var player = window.player = videojs('video');
    }(window, window.videojs));
  }
};

export { initVideo };
