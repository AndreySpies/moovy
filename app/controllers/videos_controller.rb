class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]

  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    authorize @video
    if @video.save
      redirect_to video_path(@video.url), notice: 'Your video was successfully created!'
    else
      render :new
    end
  end

  def show
    authorize @video
  end

  def edit
  end

  def update
  end

  def destroy
    authorize @video
    @video.destroy
    redirect_to root_path
  end

  private

  def set_video
    url = "#{params[:id]}.#{params[:format]}"
    @video = Video.find_by(url: url)
  end

  def video_params
    params.require(:video).permit(:name)
  end
end
