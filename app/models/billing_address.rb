class BillingAddress < ApplicationRecord
  has_many :orders

  validates :billing_name, presence: true
  validates :address, presence: true
end
