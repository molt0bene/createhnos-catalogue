class AddRatingToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :rating, :float, default: 0.0
  end
end
