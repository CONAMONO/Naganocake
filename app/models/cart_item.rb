class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :quantity, presence: true
	validates :taxed_price, presence: true
	validates :production_status, presence: true
end
