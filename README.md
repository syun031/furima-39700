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
|date|string|null: false|

### Association
  has_many :items
  has_many :purchases

# Itemsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|products_id|integer|null: false|
|product_description_id|integer|null: false|
|category_id|integer|null: false|
|product_condition|integer|null: false|
|shipping_charges_id|integer|null: false|
|days_to_ship_id|integer|null: false|
|price|string|null: false|
|seller|references|null: false, foreignkey|
|region_of_origin_id|integer|null: false|

# Purchasesテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|payment_method|string|null: false, foreignkey|
|buyer|string|null: false, foreignkey|
|product|string|null: false, foreignkey|
|user|string|null: false, foreignkey|
|item|string|null: false, foreignkey|

### Association
has_many :user
belongs_to :shipping
has_one :items

# shippingsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|address|string|null: false|
|prefecture|string|null: false|
|building_name|string|null: false|
|post_code|string|null: false|
|region_of_origin_id|integer|null: false|
|phone_number|string|null: false|
|city_town_village_id|integer|null: false|
|purchase|string|null: false, foreignkey|
