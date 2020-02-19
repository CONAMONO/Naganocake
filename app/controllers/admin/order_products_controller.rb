class Admin::OrderProductsController < ApplicationController

	def update
		@order_product = OrderProduct.find(params[:id])
		@order = @order_product.order
		@order_products = @order.order_products
		if 	@order_product.update(order_product_params)
			if @order_products.where(production_status: "製作完了").count == @order_products.count then
				@order.update(order_status: "発送準備中")
			elsif @order_product.production_status == "製作中"then
				@order.update(order_status: "製作中")
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
