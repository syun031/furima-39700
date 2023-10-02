FactoryBot.define do
  factory :purchase_shipping do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city_town_village { 'テスト市' }
    address { 'テスト町1-2-3' }
    building_name { 'テストビル103' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
