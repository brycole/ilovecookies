class DeliveryAddress < ApplicationRecord
  has_many :orders

  validates :delivery_name, presence: true
  validates :address, presence: true
end
