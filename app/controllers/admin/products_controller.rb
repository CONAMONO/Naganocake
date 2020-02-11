class Admin::ProductsController < ApplicationController
	def index
		@product = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path(@product.id)
		else
			@product = Product.new(product_params)
			render 'create'
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
	end

	private
	def product_params
		params.require(:product).permit(:image,:name,:explain,:genre_id,:non_taxed_price,:sale_status)
	end
end
