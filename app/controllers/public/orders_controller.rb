class Public::OrdersController < ApplicationController
	def top
	end
	def index
		@user = User.find(current_user.id)
	  	@orders = @user.orders
	end
	def show
		@order = Order.find(params[:id])
	    @order_products = @order.order_products
	    @products = Product.all
	end

	private

end
