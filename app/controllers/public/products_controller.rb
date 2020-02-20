class Public::ProductsController < ApplicationController
	PER = 8

	def index
		@genres = Genre.where(status: "1")
		# urlにgenre_idがある場合
		if params[:genre_id]
			@genre = Genre.find_by(params[:genre_id])
			# 降順で表示
			@products = Product.where(genre_id: params[:genre_id]).page(params[:page]).per(PER)
			@products_count = @genre.products.where(sale_status: "1").count
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
