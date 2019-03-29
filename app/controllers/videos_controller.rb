class VideosController < ApplicationController
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
    url = "#{params[:id]}.#{params[:format]}"
    @video = Video.find_by(url: url)
    authorize @video
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def video_params
    params.require(:video).permit(:name)
  end
end
