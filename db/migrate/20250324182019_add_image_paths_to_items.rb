class AddImagePathsToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :image_paths, :text
  end
end
