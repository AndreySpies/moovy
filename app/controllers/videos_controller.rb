class VideosController < ApplicationController
  before_action :set_video, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: %i[show collection increase_views]

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

  def show; end

  def collection
    @user = User.find_by(display_name: params[:user])
    @videos = Video.where(user: @user)
    authorize @videos
  end

  def edit
    url = "#{params[:url]}.#{params[:format]}"
    @video = Video.find_by(url: url)
    authorize @video
  end

  def update
    @video = Video.find(params[:id])
    authorize @video
    if @video.update(video_params)
      @video.update_column(:url, "#{@video.id}-#{@video.name.parameterize}.m3u8")
      redirect_to video_path(@video.url), notice: 'Your video was successfully updated!'
    else
      render :edit
    end
  end


  def destroy
    authorize @video
    @video.destroy
    redirect_to root_path
  end

  def increase_views
    @video = Video.find(params[:id])
    authorize @video
    @views = @video.views + 1
    respond_to { |format| format.js } if @video.update(views: @views)
  end

  private

  def set_video
    url = "#{params[:id]}.#{params[:format]}"
    @video = Video.find_by(url: url)
    authorize @video
  end

  def video_params
    params.require(:video).permit(:name, :miniature)
  end
end
