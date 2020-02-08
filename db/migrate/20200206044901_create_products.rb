class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
	  t.string :name
      t.string :image_id
      t.text :explain
      t.integer :non_taxed_price
      t.boolean :sale_status
      t.timestamps
    end
  end
end
