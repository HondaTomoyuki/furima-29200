class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @user = User.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to user_session_path
      end
    
  end



  private

  def item_params
    params.require(:item).permit(:name, :details, :category_id, :status_id, :burden_id, :delivery_area_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
    # params.require(:item).permit(:content, :image)
  end
end
