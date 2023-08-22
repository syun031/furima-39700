# Usersテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|name|string|null: false|
|email|string|null: false, unique:true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_date|date|null: false|

### Association
  has_many :items
  has_many :purchases

# Itemsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|products|string|null: false|
|product_description|text|null: false|
|category_id|integer|null: false|
|product_condition_id|integer|null: false|
|shipping_charges_id|integer|null: false|
|days_to_ship_id|integer|null: false|
|price||null: false|
|user|string|null: false, foreign_key: true|
|region_of_origin_id|intejer|null: false|
|prefecture_id|integer|null: false|

# Purchasesテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|user|string|null: false, foreignkey|
|item|string|null: false, foreignkey|

### Association
belongs_to :user
has_one :shipping
belongs_to :item

# shippingsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|address|string|null: false|
|prefecture_id|integer|null: false|
|building_name|string| |
|post_code|string|null: false|
|phone_number|string|null: false|
|city_town_village_id|integer|null: false|
|purchase|string|null: false, foreign_key: true|

### Association
has_one :purchase