require 'rails_helper'

RSpec.describe Order, type: :model do
  it "can be created without any foreign keys" do
    order = Order.new

    expect(order).to be_valid
  end

  it "can be assigned a user" do
    order = Order.new
    user = User.create!(email: 'test@test.com', password: 'test123', password_confirmation: 'test123')

    order.user = user
    order.save

    expect(order.user.email).to eq("test@test.com")
  end

  it "can have a billing address" do
    order = Order.new
    billing_address = BillingAddress.create(billing_name: "bob", address: "123 test")

    order.billing_address = billing_address
    order.save

    expect(order.billing_address.billing_name).to eq("bob")
  end

  it "can have a delivery address" do
    order = Order.new
    delivery_address = DeliveryAddress.create(delivery_name: "bob", address: "123 test")

    order.delivery_address = delivery_address
    order.save

    expect(order.delivery_address.delivery_name).to eq("bob")
  end

  it "can have a status of basket" do
    order = Order.new
    order.status = 0
    order.save

    expect(order.status).to eq("basket")
  end

  it "can have a status of address" do
    order = Order.new
    order.status = 1
    order.save

    expect(order.status).to eq("address")
  end

  it "can have a status of complete" do
    order = Order.new
    order.status = 2
    order.save

    expect(order.status).to eq("complete")
  end
end
