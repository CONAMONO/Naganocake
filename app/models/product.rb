class Product < ApplicationRecord
  has_many :cart_items,  dependent: :destroy
  has_many :order_products,  dependent: :destroy
  belongs_to :genre
  attachment :image

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :non_taxed_price, presence: true
  validates :sale_status, inclusion: {in: [true, false]}
end
