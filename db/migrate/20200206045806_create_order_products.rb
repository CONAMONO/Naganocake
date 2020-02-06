class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_count
      t.integer :taxed_price
      t.integer :production_status

      t.timestamps
    end
  end
end
