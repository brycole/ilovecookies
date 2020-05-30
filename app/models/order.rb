class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :billing_address, optional: true
  belongs_to :delivery_address, optional: true

  has_many :order_items

  enum status: %i[basket address complete]
end
