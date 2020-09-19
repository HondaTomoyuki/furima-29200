require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it "name,details,genre_id,status_id,burden_id,prefecture_id,delivery_day_id,price,image" do
        expect(@item).to be_valid
      end
    end
  end

  context '新規登録がうまくいかないとき' do
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "detailsが空だと登録できない" do
      @item.details = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end
    it "genre_idが空だと登録できない" do
      @item.genre_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre is not a number")
    end
    it "genre_idが1だと登録できない" do
      @item.genre_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre must be other than 1")
    end
    it "status_idが空だと登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end
    it "status_idが1だと登録できない" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "burden_idが空だと登録できない" do
      @item.burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank", "Burden is not a number")
    end
    it "burden_idが1だと登録できない" do
      @item.burden_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end
    it "prefecturea_idが1だと登録できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "delivery_day_idが空だと登録できない" do
      @item.delivery_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
    end
    it "deliveryday_idが1だと登録できない" do
      @item.delivery_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end
    it "priceが300未満だと登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが9999999より大きいと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceが半角数字以外だと登録できない" do
      @item.price = "２２２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "imageがないと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end


