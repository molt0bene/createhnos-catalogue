class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :item_id
      t.float :rating
      t.text :comment

      t.timestamps
    end
  end
end
