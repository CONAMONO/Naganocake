class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :pay
      t.string :name_address
      t.string :street_address
      t.string :postal_code
      t.string :payment_method
      t.string :order_status
      t.timestamps
    end
  end
end
