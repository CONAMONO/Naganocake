class AddSaleStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale_status, :boolean
  end
end
