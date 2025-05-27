class Item < ApplicationRecord
  has_many :users, through: :favourite_items
  has_many :reviews, dependent: :destroy

  serialize :image_paths, type: Array, coder: JSON

  validates :name, :price, presence: true

  def average_rating
    reviews_scope = Review.where(item_id: id)
    return reviews_scope.pluck(:rating).sum / reviews_scope.count.to_f if reviews_scope.present?

    0
  end
end
