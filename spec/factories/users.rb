FactoryBot.define do
  factory :user do
    nickname { '佐藤taro' }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    last_name { '佐藤さとうサトウ' }
    first_name { '太郎たろうタロウ' }
    last_name_kana { 'サトウ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
