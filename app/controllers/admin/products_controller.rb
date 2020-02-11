class Admin::ProductsController < ApplicationController
	def index
		@product = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		binding.pry
		if @product.save
			redirect_to admin_products_path
		else
			@product = Product.new
			render 'new'
		end
	end

	private
	def product_params
		params.require(:product).permit(:image,:name,:explain,:genre_id,:non_taxed_price,:sale_status)
	end
end
