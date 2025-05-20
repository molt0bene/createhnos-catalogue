class CreateOrderRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :order_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :items_ids

      t.timestamps
    end
  end
end
