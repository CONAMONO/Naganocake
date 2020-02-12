class Admin::OrdersController < ApplicationController
  def top
  end

  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_product = Order_Product.find(@order.order_product.id)
  end

  private
  def order_params
		params.require(:order).permit(:user_id, :order_day, :total_price, :pay, :name_address, :street_address, :postal_code,
			:payment_method,:order_status)
	end

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :quantity, :taxed_price, :production_status)
  end

end