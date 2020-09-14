class PrefectureController < ApplicationController
  def index
    @prefecture = Prefecture.order("created_at DESC")

    def new
      @prefecture = Prefecture.new
    end
  
    def create
      @prefecture = Prefecturee.new(prefecture_params)
    end

    private

  def prefecture_params
    params.require(:prefecture).permit(:title,:text,:prefecture_id)
  end
  
end
