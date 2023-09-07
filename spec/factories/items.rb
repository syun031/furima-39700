FactoryBot.define do
  factory :item do
    product { 'Product Name' }
    product_description { 'Product Description' }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    days_to_ship_id { 2 }
    price { 1000 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public', 'images', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
