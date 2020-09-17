class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :details
    
  end

    with_options presence: true do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :delivery_area_id
      validates :delivery_time_id
      validates :image
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :delivery_area_id
      validates :delivery_time_id
    end

      validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, 
                        numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
      
end
