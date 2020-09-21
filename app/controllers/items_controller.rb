class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
     if @item.update (item_params)
        redirect_to action: :show
     else
        render :edit
     end
  end
   
  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :show
    end
  end



  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :details, :genre_id, :status_id, :burden_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end

