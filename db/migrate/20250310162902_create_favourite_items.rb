class CreateFavouriteItems < ActiveRecord::Migration[7.1]
  def change
    create_table :favourite_items do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
