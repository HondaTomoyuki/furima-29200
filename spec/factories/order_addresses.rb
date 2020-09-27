FactoryBot.define do
  factory :order_address do
    # association :item

    postal_code            {"807-1261"}
    prefectures_id         {2}
    phone_number           {"09012341234"}
    city                   {"東京都港区"}
    house_number           {1-2-3}
    token                  {'OrderAddress:0x00007fcc1f87fe6'}
  end
end
