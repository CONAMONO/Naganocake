class Admin::OrdersController < ApplicationController
  def top
    @today_order = Order.where(created_at: Time.now.all_day)
  end

  def index
    @order_products = OrderProduct.all
    if params[:link] == "top"
    @orders = Order.where(created_at: Time.now.all_day)
    elsif params[:link] == "user"
       @user = User.find(params[:user_id])
       @orders = @user.orders
    else
    	@orders = Order.all
    end
  end

  def show
  	@order = Order.find(params[:id])
    @order_products = @order.order_products
    @products = Product.all
    $url ="user"
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
    params.require(:order).permit(:user_id,:total_price,:pay,:name_address,:street_address,:postal_code,:payment_method,:order_status,)
  end

  def order_product_params
    params.require(:order_product).permit(:order_id,:product_id,:product_count,:taxed_price,:production_status,)
  end

end
