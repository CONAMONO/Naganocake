class Genre < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :name, presence: true
	validates :status, inclusion: {in: [true, false]}
end
