class Admin::OrdersController < ApplicationController
  def top
    # @today_order = Order.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
    @today_order = Order.where(created_at: Time.now.all_day)
  end

  def index
  	@orders = Order.all
    @order_products = OrderProduct.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_products = @order.order_products
    @products = Product.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.order_status == "入金確認" then
         @order_products = @order.order_products
         @order_products.update(production_status: "製作待ち")
      end
      redirect_to admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id,:order_day,:total_price,:pay,:name_address,:street_address,:postal_code,:payment_method,:order_status,)
  end

  def order_product_params
    params.require(:order_product).permit(:order_id,:product_id,:product_count,:taxed_price,:production_status,)
  end

end
