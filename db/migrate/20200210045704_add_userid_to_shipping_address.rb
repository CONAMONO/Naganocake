class AddUseridToShippingAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_addresses, :user_id, :integer
  end
end
