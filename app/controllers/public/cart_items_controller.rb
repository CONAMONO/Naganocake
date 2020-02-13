class Public::CartItemsController < ApplicationController
	def create

	end

	def index
		@cart_items = current_user.cart_items.all
		@products = Product.all
	end

	def update
		cart_item = CartItem.find(params[:id])
		#flash[:success] = 'You have updated user successfully.'

		if cart_item.update(cart_item_params)
			redirect_to public_cart_items_path and return
		else
			@cart_items = current_user.cart_items.all
			@error = "・0以上の数字を入力してください"
			render action: :index
		end
	end

	def destroy
		if params[:id] == "destroy"
			#カート一覧削除
			del_flg = false
			cart_items = current_user.cart_items.all
			cart_items.each do |cart_item|
				cart_item.destroy
			end
			redirect_to public_cart_items_path
		else
			#商品一つ削除
			cart_item = CartItem.find(params[:id])
			cart_item.destroy
			redirect_to public_cart_items_path
		end
	end

    private
    def cart_item_params
    	added_attrs = [:quantity]
        params.require(:cart_item).permit(added_attrs)
    end
end
