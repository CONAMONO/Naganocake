class AddFirstNameKataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name_kata, :string
  end
end
