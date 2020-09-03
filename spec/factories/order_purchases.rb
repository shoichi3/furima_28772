FactoryBot.define do
  factory :order_purchase do
    token              {Faker::Lorem.characters(number:20)}
    postal_code        {'123-4567'}
    prefecture_id      {Faker::Number.between(from: 2, to: 48)}
    city               {'東京都'}
    address            {'1-1'}
    building           {'マンション'}
    phone_number       {Faker::PhoneNumber.cell_phone_in_e164}
  end
end