class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase

  validates :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :product_condition_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality:  { other_than: 1 , message: "can't be blank"}
end
