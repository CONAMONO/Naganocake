class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product
	validates :order_id, presence: true
	validates :product_id, presence: true
	validates :product_count, presence: true
	validates :taxed_price, presence: true
	validates :production_status, presence: true
end
