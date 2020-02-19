class ShippingAddress < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name_address, presence: true
  validates :street_address, presence: true
  validates :postal_code, presence: true
  validates :postal_code,
    length: { minimum: 7, maximum: 7 }

  def view_address
    "〒" + self.postal_code + " " + self.street_address + " " + self.name_address
  end
end
