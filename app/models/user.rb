class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 20 }

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sold_items, ->{ where("buyer_id is not NULL") },foreign_key: "user_id", class_name: "Item"
end
