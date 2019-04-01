// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
let first_play = true
const video = document.getElementById("video");

const videoPlay = () => {
  if (first_play) {
    first_play = false
    increaseViews();
  }
};

const increaseViews = () => {
  const videoId = document.getElementById('video-title').getAttribute("data-video");
  Rails.ajax({
    url: `/videos/views/${videoId}`,
    type: "PATCH",
    data: `video[views]=1`,
    dataType : "text"
  });
};
