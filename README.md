# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile|string||
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|avatar_image|string||
|phone_number|string||

### Association
- has_one :credit_card, dependent: :destroy
- has_many :social_profiles, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :buyed_items, foreign_key: buyer_id, class_name: 'Item'
- has_many :sell_items, foreign_key: seller_id, class_name: 'Item'
- has_many :sold_items, foreign_key: seller_id, class_name: 'Item'
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_one :address, dependent: destroy

## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||

### Association
- belongs_to :user


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|cvc|integer|null: false|
|exp_month|integer|null: false|
|exp_year|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## social_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|image_url|string||
|provider|string|null: false|
|uid|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|detail|text|null: false|
|category_id|references|null: false, foreign_key: true|
|state|string|null: false|
|price|integer|null: false|
|delivery_cost|string|null: false|
|delivery_area|string|null: false|
|delivery_day|string|null: false|
|size|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand
- belongs_to :buyer, class_name: 'User'
- belongs_to :seller, class_name: 'User'
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
