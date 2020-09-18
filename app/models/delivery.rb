# class Delivery < ApplicationRecord
#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to_active_hash :delivery_day

#   #空の投稿を保存できないようにする
#   validates :title, :text, :delivery_day, presence: true

#   #ジャンルの選択が「--」の時は保存できないようにする
#   validates :delivery_day_id, numericality: { other_than: 1 } 
# end
