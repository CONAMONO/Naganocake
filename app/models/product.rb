class Product < ApplicationRecord
  has_one :cart_item,  dependent: :destroy
  has_one :order_product,  dependent: :destroy
  belongs_to :genre


  validates :name_address, presence: true
  validates :street_address, presence: true
  validates :postal_code, presence: true
end
