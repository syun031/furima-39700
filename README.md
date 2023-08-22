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
|product|string|null: false|
|product_description|text|null: false|
|category_id|integer|null: false|
|product_condition_id|integer|null: false|
|shipping_charge_id|integer|null: false|
|days_to_ship_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
|prefecture_id|integer|null: false|

### Association
belongs_to :user
has_one :purchase

# Purchasesテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

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
|city_town_village|string|null: false|
|purchase|references|null: false, foreign_key: true|

### Association
belongs to :purchase