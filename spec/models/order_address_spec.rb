require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '出品機能実装' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    
      it 'すべての値が正しく入力されていれば保存できること' do
       expect(@order_address).to be_valid
      end
   
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'postal_codeが半角数字のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it "prefectures_idが1だと登録できない" do
      @order_address.prefectures_id = "1"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank", "City is invalid")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it 'house_numberはハイフンは不要で、半角数字11桁以内でないと保存できないこと' do
      @order_address.phone_number = 123456789012
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end