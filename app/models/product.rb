class Product < ApplicationRecord
  has_one :cart_item,  dependent: :destroy
  has_one :order_product,  dependent: :destroy
  belongs_to :genre

  validates :name, presence: true
  validates :non_taxed_price, presence: true
  validates :sale_status, presence: true
end
