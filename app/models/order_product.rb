class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product
	validates :product_count, presence: true
	validates :taxed_price, presence: true
	validates :production_status, presence: true
end
