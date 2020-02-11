class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :first_name_kata
    	t.string :last_name_kata
    	t.string :email
    	t.string :password
    	t.string :street_address
    	t.string :postal_code
    	t.string :phone_number
    	t.boolean :user_status

      t.timestamps
    end
  end
end
