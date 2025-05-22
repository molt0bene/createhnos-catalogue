class AddEmailToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :email, :string, null: false, default: ''
  end
end
