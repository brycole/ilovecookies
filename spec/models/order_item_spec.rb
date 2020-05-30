require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it "must have a product and an order" do
    product = Product.create(name: "Cookie")
    order = Order.create

    order_item = OrderItem.create(product: product, order: order)

    expect(order_item).to be_valid
  end

  it "cannot have a quantity of zero" do
    product = Product.create(name: "Cookie")
    order = Order.create

    order_item = OrderItem.create(product: product, order: order, quantity: 0)

    expect(order_item).to be_invalid
  end
end
