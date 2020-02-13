class Public::ProductsController < ApplicationController
	def index
		@genre_name = Genre.select("name")
		@genre_count = Genre.select("id").count
		# urlにgenre_idがある場合
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			# 降順で表示
			@products = @gnere.products.order(created_at: :desc).all
		else
			@products = Product.all
		end

	end

	def show
		@product = Product.find(params[:id])
		@cart = CartItem.new
	end
end
