class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to items_path
      else
        render :new
      end
  end 

  def show
    @item = Item.find(params[:id])
  end

  # def update
  #   @item = Item.all(params[:id])
  #   @item.update params.require(:item).permit(:name, :details, :genre_id, :status_id, :burden_id, :delivery_area_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id) 
  #   redirect_to @item
  # end
  


  private

  def item_params
    params.require(:item).permit(:name, :details, :genre_id, :status_id, :burden_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
