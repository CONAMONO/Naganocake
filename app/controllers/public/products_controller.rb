class Public::ProductsController < ApplicationController
	PER = 8

	def index
		@genres = Genre.where(status: "1")
		# urlにgenre_idがある場合
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			# 降順で表示
			@products = Product.where(genre_id: params[:genre_id])
			@products = Product.page(params[:page]).per(PER)
			@products_count = @products.count
		else
			@products_count = Genre.select("id").count
			@products = Product.all
		end
	end

	def show
		@product = Product.find(params[:id])
		@cart = CartItem.new
		@genres = Genre.where(status: "1")
	end
end
