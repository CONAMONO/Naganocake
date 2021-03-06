class Admin::ProductsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@products = Product.page(params[:page]).per(10)
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path(@product.id)
		else
			@product = Product.new
			render 'new'
		end
	end	

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_product_path(@product.id)
		else
			render 'edit'
		end
	end

	private
	def product_params
		params.require(:product).permit(:image,:name,:explain,:genre_id,:non_taxed_price,:sale_status)
	end
end
