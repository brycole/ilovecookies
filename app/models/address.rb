class Address < ApplicationRecord
  has_many :orders

  validates :customer_name, presence: true
  validates :full_address, presence: true


end
