class Item < ApplicationRecord
  belongs_to :user
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :brand, optional: true
  belongs_to :category
  has_many :item_images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :item_images, allow_destroy: true

    enum cost: {
      "送料込み(出品者持ち)":1, "着払い(購入者持ち)":2
    }

    enum area: {
      北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
      茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
      新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
      岐阜県:21,静岡県:22,愛知県:23,三重県:24,
      滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
      鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
      徳島県:36,香川県:37,愛媛県:38,高知県:39,
      福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47, 未定:48
    }

    enum day: {
      "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
    }

  scope :set_brand, -> (num){ where(brand_id: num).limit(4).order("RAND()") }
  scope :set_category, -> (num){ where(category_id: num).order("RAND()").limit(4) }
  scope :search_category, -> num{where(category_id: num ).order("id DESC").limit(4)}
  scope :search_brand, -> brand{where(brand_id: brand).order("id DESC").limit(4)}

end

