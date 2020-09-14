class DeliveryDayController < ApplicationController
  def index
    @delivery_day = Delivery_day.order("created_at DESC")
  end

  def new
    @delivery_day = Delivery_day.new
  end

  def create
    @delivery_day = Delivery_day.new(article_params)
  end

  private

  def delivery_day_params
    params.require(:delivery_day).permit(:title,:text,:genre_id)
  end

end
