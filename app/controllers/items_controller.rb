class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @user = User.new
    @item = Item.new
  end

  def new
   
  end

  def create
    Item.create(user_id: params[:image])
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
