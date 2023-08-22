# Usersテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|name|string|null: false|
|email|string|null: false, unique:true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name(kana)|string|null: false|
|last_name(kana)|string|null: false|
|date_of_birth|string|null: false|

### Association
  has_many :items
  has_many :purchases

# Itemsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|products_id|integer|null: false|
|product_description_id|integer|null: false|
|category_id|integer|null: false|
|price|string|null: false|
|seller|references|null: false, foreignkey|
|region_of_origin_id|integer|null: false|

# Purchasesテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|payment_method|string|null: false, foreignkey|
|buyer|string|null: false, foreignkey|
|product|string|null: false, foreignkey|

### Association
belongs_to :user
belongs_to :shipping
has_one :items

# shippingsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|address|string|null: false|
|post_code|string|null: false|
|region_of_origin_id|integer|null: false|
|phone_number|string|null: false|
|city_town_village|string|null: false|

