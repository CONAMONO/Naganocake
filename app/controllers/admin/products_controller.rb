class Admin::ProductsController < ApplicationController
	def index
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path
		else
			render 'new'
			@product = Product.new
		end
	end

	private
	def product_params
		params.require(:product).permit(:image,:name,:explain,:genre,:non_taxed_price)
	end
end
