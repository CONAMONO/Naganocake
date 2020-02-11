class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :name_address
      t.string :street_address
      t.string :postal_code
      t.integer :user_id

      t.timestamps
    end
  end
end
