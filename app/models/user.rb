class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 20 }

  has_many :items, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
end
