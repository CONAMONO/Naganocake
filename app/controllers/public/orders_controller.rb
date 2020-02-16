class Public::OrdersController < ApplicationController
	
	
	def top
		@products = Product.all
		@products_count = Product.select("id").count
		@product_name = Product.select("name")
		@product_price = Product.select("non_taxed_price")
		@genres = Genre.all
	end

	def new
		#@address_select = {:ご自身の住所=>1, :登録済住所から選択=>2, :新しいお届け先=>3}
		@order = Order.new
		@shipping_addresses = current_user.shipping_addresses.all
		@user = User.find(current_user.id)
	end

	
	def index
		@user = User.find(current_user.id)
	  	@orders = @user.orders
	  	@order_products = OrderProduct.all
	  	@products = Product.all
	end
  
	def show
		@order = Order.find(params[:id])
	    @order_products = @order.order_products
	    @products = Product.all
	end


	def create
	  tax = 1.10
	  @cart_items = current_user.cart_items.all
      order = Order.new(order_params)
      #order.pay = 800
      #order.total = @total

      if params[:order][:address_id] == "3"
		  @shipping_address = ShippingAddress.new
		  @shipping_address.user_id = current_user.id
		  @shipping_address.name_address = params[:order][:name_address]
		  @shipping_address.street_address = params[:order][:street_address]
		  @shipping_address.postal_code = params[:order][:postal_code]

		  if @shipping_address.save == false
			render action: :confirm
			return
		  end
	  end

      if order.save == true
      	#flash[:success] = 'You have creatad book successfully.'
		@cart_items.each do |cart_item|
			order_product = OrderProduct.new
			order_product.product_count = cart_item.quantity
			order_product.taxed_price = (cart_item.product.non_taxed_price * tax).floor
			order_product.production_status = "着手不可"
			order_product.order_id = order.id
			order_product.product_id = cart_item.product_id

			if order_product.save == false
				@error += "・" + cart_item.id + "が正常に登録できませんでした"
				render action: :confirm
				return
			end
		end

		@cart_items.destroy_all

        redirect_to public_orders_thanks_path and return
      else

		@products = Product.all
		@order = Order.new
		@user = User.find(current_user.id)
		@shipping_addresses = current_user.shipping_addresses.all
		@shipping_address = ShippingAddress.new
		@payment_method = params[:order][:order][:payment_method]
		@address_id = params[:order][:address_id]
		@select_addr = params[:order][:select_addr]
		@new_postal_code = params[:order][:postal_code]
		@new_street_address = params[:order][:street_address]
		@new_name = params[:order][:name_address]
        render action: :confirm
      end
	end

	def confirm
		@cart_items = current_user.cart_items.all
		@products = Product.all
		@order = Order.new
		@user = User.find(current_user.id)
		@shipping_addresses = current_user.shipping_addresses.all
		@shipping_address = ShippingAddress.new
		@payment_method = params[:payment_method]
		@address_id = params[:address_id]
		@select_addr = params[:select_addr]
		@new_postal_code = params[:new_postal_code]
		@new_street_address = params[:new_street_address]
		@new_name = params[:new_name]
	end

	def thanks
	end

    private
    def order_params
    	added_attrs = [:order_day, :user_id, :total_price, :pay, :name_address, :street_address, :postal_code, :payment_method, :order_status]
        params.require(:order).permit(added_attrs)
    end

    def order_product_params
    	added_attrs = [:product_count, :taxed_price, :production_status, :order_id, :product_id]
        params.require(:order).permit(added_attrs)
    end

	def shipping_address_params
		params.require(:shipping_address).permit(:name_address, :street_address,:postal_code)
	end
end
