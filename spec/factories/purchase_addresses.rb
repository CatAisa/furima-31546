FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    token { 'tok_abcdefghijklmn0123456789' }
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
  end
end
