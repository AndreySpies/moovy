class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @videos = Video.all.order(:id).reverse
  end
end
