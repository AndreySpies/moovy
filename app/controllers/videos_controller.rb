class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      redirect_to video_path(@video.url)
    else
      render :new
    end
  end

  def show
    url = "#{params[:id]}.#{params[:format]}"
    @video = Video.find_by(url: url)
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
