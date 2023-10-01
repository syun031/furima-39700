class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :address, :prefecture_id, :building_name, :post_code, :phone_number, :city_town_village, :purchase, :token

  with_options presence: true do
  validates :token, presence: true
  validates :item_id
  validates :user_id
  validates :address, presence: true
  validates :prefecture_id, presence: true
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  validates :city_town_village, presence: true
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Shipping.create(address: address, prefecture_id: prefecture_id, building_name: building_name, post_code: post_code, phone_number: phone_number, city_town_village:city_town_village, purchase:purchase)
  end
end