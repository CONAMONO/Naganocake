class Public::OrdersController < ApplicationController
	def top
		@products = Product.all
		@products_count = Product.select("id").count
		@product_name = Product.select("name")
		@product_price = Product.select("non_taxed_price")
		@genres = Genre.all
	end

end
