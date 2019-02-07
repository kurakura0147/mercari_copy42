class Item < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  scope :set_items, -> (num){where(price: num).limit(4).order("id DESC")}

end
