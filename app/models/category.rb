class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  has_ancestry
  scope :search_ancestry, -> num{where("ancestry like '#{num}/%'")}
end
