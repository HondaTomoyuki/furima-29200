class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code,    format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :phone_number,   format: { with: /\A\d{11}\z/ }
    validates :city,           format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create!(postal_code: postal_code, prefectures_id: prefectures_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  
  end
end