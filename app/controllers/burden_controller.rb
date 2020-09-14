class BurdenController < ApplicationController
  
  @burden = Burden.order("created_at DESC")

  def new
    @burden = Burden.new
  end

  def create
    @burden = Burden.new(burden_params)
  end

  private

  def burdene_params
    params.require(:burden).permit(:title,:text,:genre_id)
  end

end
