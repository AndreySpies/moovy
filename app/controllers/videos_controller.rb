class VideosController < ApplicationController
  def show
    @video = Video.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
