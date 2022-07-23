FactoryBot.define do
  factory :item do
    title { 'test' }
    description     { 'test' }
    category_id     { 2 }
    condition_id    { 2 }
    charge_id       { 2 }
    area_id         { 2 }
    delivery_day_id { 2 }
    price           { 2000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
