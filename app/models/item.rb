class Item < ApplicationRecord
  has_many :users, through: :favourite_items
  has_many :reviews
end
