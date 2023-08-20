# Usersテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|name|string|null: false|
|email|string|null: false, unique constraint|
|encrypted_password|string|null: false|
|user_type|string|null: false|
|listing_history|string|null: false|
|purchase_history|string|null: false|
|profile|string|null: false|

### Association
  has_many :address
  has_many :purchases

# Itemsテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|products|string|null: false|
|product_description|string|null: false|
|category|string|null: false|
|price|text|null: false|
|seller|references|null: false|

# Purchaseテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|payment method|string|null: false|
|buyer|string|null: false|
|product|string|null: false|

### Association
belongs_to :user
belongs_to :address

# shippingテーブル

|Column|Type|Options|
| ---- | -- | ----- |
|address|string|null: false|
|post-code|string|null: false|
|prefecture|string|null: false|
|phone_number|string|null: false|
|city/town/village|string|null: false|

