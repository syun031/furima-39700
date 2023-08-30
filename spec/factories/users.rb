FactoryBot.define do
  factory :user do
    nickname { "テスト" }
    email {Faker::Internet.email}
    password { "Abc123+" }
    password_confirmation {"Abc123+"}
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { Faker::Name.last_name }
    first_name_kana { Faker::Name.first_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end