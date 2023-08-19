# Usersテーブル

|Column|Type|Options|
|name|string型|NOT NULL|
|email|string型|NOT NULL,ユニーク制約|
|password|string型|NOT NULL|


# Itemsテーブル

|Column|Type|Options|
|products|string型|NOT NULL|
|category|string型|NOT NULL|
|price|text型|NOT NULL|
|seller|references型|NOT NULL|



# Purchaseテーブル

|Column|Type|Options|
|address|string型|NOT NULL|
|post-code|string型|NOT NULL|
|telephone-number|string型|NOT NULL|
|who|references型|NOT NULL|
|buy|references型|NOT NULL|

# shippingテーブル

|Column|Type|Options|
|address|string型|NOT NULL|
|post-code|string型|-------NOT NULL|

### Association
（ここに追記していく）