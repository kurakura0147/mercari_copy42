class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
end
