class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :last_name
      t.integer :item_id
      t.float :rating
      t.text :comment

      t.timestamps
    end
  end
end
