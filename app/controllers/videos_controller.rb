class VideosController < ApplicationController
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
end
