FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.non_zero_digit }
    condition_id { Faker::Number.non_zero_digit }
    payment_id { Faker::Number.non_zero_digit }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    period_id { Faker::Number.non_zero_digit }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
