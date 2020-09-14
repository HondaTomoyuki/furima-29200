class AppearanceController < ApplicationController
  def index
    @appearance = Appearance.order("created_at DESC")
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
  end

  private

  def appearance_params
    params.require(:appearance).permit(:title,:text,:genre_id)
  end

end
