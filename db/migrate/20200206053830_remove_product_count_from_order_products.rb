class RemoveProductCountFromOrderProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_products, :product_count, :integer
  end
end
