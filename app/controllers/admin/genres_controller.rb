class Admin::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admin_genres_path
		else
			render 'index'
			@genre =Genre.new
			@genres = Genre.all
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
	end

	private
	def genre_params
		params.require(:genre).permit(:name,:status)
	end

end
