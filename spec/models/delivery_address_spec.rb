require 'rails_helper'

RSpec.describe DeliveryAddress, type: :model do
  it "requires a name to be valid" do
    delivery_address = DeliveryAddress.new(delivery_name: nil, address: "123 test street")

    expect(delivery_address).to be_invalid
  end

  it "requires an address to be valid" do
    delivery_address = DeliveryAddress.new(delivery_name: "Bob", address: nil)

    expect(delivery_address).to be_invalid
  end

  it "requires both an address and a name to be valid" do
    delivery_address = DeliveryAddress.new(delivery_name: "Bob", address: "123 test street")

    expect(delivery_address). to be_valid
  end
end
