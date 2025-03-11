class User < ApplicationRecord
  has_many :reviews
  has_many :items, through: :favourite_items
end
