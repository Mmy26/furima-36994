FactoryBot.define do
  factory :item do
    title         {'aaa'}
    explanation    {'あああ'}
    category_id    { 2 }
    status_id      { 2 }
    fee_id         { 2 }
    region_id      { 2 }
    shipped_day_id { 2 }
    price          { 5000 }
 
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
