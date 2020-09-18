class AppearanceController < ApplicationController
  def index
    @appearances = Appearance.order("created_at DESC")
  end

  def new
    @appearances = Appearance.new
  end

  def create
    @appearances = Appearance.new(appearance_params)
  end

  private

  def appearance_params
    params.require(:appearance).permit(:title,:text,:genre_id)
  end

end
