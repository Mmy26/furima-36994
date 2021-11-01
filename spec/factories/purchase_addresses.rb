FactoryBot.define do
  factory :purchase_address do
    zip_code       { '111-1111' }
    region_id      { 2 }
    city           {'ああああ'}
    street         {'ああああ'}
    building       {'ああああ'}
    phone_number   { '11111111111' }
    token          {'tok_abcdefghijk00000000000000000'}
    user_id        { 2 }
    item_id        { 2 }
  end
end
