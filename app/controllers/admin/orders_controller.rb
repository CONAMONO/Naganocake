class Admin::OrdersController < ApplicationController
  def top
  end

  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@orer_product = Order_products.find(@order.parames_id)
  end

  private
  def order_params
    	added_attrs = [:order_day, :total_price, :pay, :name_address, :street_address, :postal_code, :payment_method, :order_status]
        params.require(:order).permit(added_attrs)
  end

  def order_products_params
		params.require(:order_products).permit(:product_id,:quantity,:taxed_price,:production_status)
  end
end