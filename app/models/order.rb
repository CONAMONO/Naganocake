class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy

  validates :user_id, presence: true
  validates :total_price,  presence: true
  validates :pay, presence:true
  validates :name_address, presence: true
  validates :street_address, presence: true
  validates :postal_code, presence: true
  validates :payment_method, presence: true
  validates :order_status, presence: true

end