class Public::ShippingAddressesController < ApplicationController
	def index
		@shipping_addresses = ShippingAddress.all
		@shipping_address = ShippingAddress.new
	end

	def edit
	end

	def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.user_id = current_user.id
		if @shipping_address.save
			redirect_back(fallback_location: public_shipping_addresses_path)
		else
			redirect_to public_shipping_addresses_path
		end

	end

	def new
		@shipping_address = ShippingAddress.new
	end

	def update
		@shipping_address = @ShippingAddress.find(params[:id])
		@shipping_address.update(shipping_address_params)
	end

	def destroy
		shipping_address = ShippingAddress.find(params[:id])
		shipping_address.destroy
		redirect_to root_path
	end

	private
	def shipping_address_params
		params.require(:shipping_address).permit(:name_address, :street_address,:postal_code)
	end
end
