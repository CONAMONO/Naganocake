class AddNonTaxedPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :non_taxed_price, :integer
  end
end
