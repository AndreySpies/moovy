// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var first_play = true
var video = document.getElementById("video");

function videoPlay() {
  if (first_play) {
    first_play = false
    increaseViews();
  }
};

function increaseViews() {
  var videoId = document.getElementById('video-title').getAttribute("data-video");
  Rails.ajax({
    url: "/videos/views/"+videoId+"",
    type: "PATCH",
    data: `video[views]=1`,
    dataType : "text"
  });
};
