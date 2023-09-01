FactoryBot.define do
  factory :user do
    nickname { "テスト" }
    email {Faker::Internet.email}
    password { "Password123+" }
    password_confirmation {"Password123+"}
    last_name { "田中"}
    first_name { "太郎" }
    last_name_kana { "タナカ" }
    first_name_kana { "タロウ" }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end