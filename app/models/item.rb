class Item < ApplicationRecord
  #商品出品機能が完成後にコメントアウトを外す
  # mount_uploader :image, ImageUploader
  belongs_to :user
  # belongs_to :brand
  # belongs_to :category
end
