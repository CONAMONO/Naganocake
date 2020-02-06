class ShippingAddress < ApplicationRecord
  belongs_to :user

  validates :name_address, presence: true
  validates :street_address, presence: true
  validates :postal_code, presence: true
end
