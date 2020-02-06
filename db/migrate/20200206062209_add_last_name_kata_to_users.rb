class AddLastNameKataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name_kata, :string
  end
end
