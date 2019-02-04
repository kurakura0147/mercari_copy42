class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :brand
  belongs_to :category
end
