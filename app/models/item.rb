class Item < ApplicationRecord
  has_one_attached :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_description
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :title, :text, presence: true
  validates :image_presence
  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, :presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :product_condition_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality:  { other_than: 1 , message: "can't be blank"}
end
