class Item < ApplicationRecord
  has_many :users, through: :favourite_items
  has_many :reviews, dependent: :destroy

  serialize :image_paths, type: Array, coder: JSON

  validates :name, :price, presence: true
end
