class OrdersController < ApplicationController
  before_action :move_to_signed_in, only: [:index]
  before_action :move_to_top_screen, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new

    if @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new(orderaddress_params)
   if @orderaddress.valid?    
      pay_item
      @orderaddress.save
      return redirect_to items_path
    else
      render :index
    end
  end

 def  done
    @item_order= Item.find(params[:id])
    @item_order.update( order_id: current_user.id)
 end
     
  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: orderaddress_params[:token],
      currency:'jpy'
    )
  end

  def orderaddress_params
    params.permit(:postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end
  
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  new_user_session_path
    end
  end

  def move_to_top_screen
    @item = Item.find(params[:item_id])
    if  user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
  

    
      
    

