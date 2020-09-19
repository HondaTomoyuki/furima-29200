FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
    name             {"景色"}
    details          {"旅行の写真です"}
    genre_id         {2}
    status_id        {2}
    burden_id        {2}
    prefecture_id    {2}
    delivery_day_id  {2}
    price            {1000}
  end
end
