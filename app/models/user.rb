class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses, dependent: :destroy
  has_many :orders,  dependent: :destroy
  has_many :cart_items, dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kata, presence: true
  validates :last_name_kata, presence: true
  validates :email, presence: true
  #validates :password, presence: true
  validates :encrypted_password, presence: true
  validates :street_address, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
  validates :user_status, inclusion: {in: [true, false]}


  validates :postal_code,
    length: { minimum: 7, maximum: 7 }
  validates :phone_number,
    length: { minimum: 10, maximum: 11 }

end
