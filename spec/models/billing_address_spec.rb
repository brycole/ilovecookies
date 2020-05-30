require 'rails_helper'

RSpec.describe BillingAddress, type: :model do
  it "requires a name to be valid" do
    billing_address = BillingAddress.new(billing_name: nil, address: "123 test street")

    expect(billing_address).to be_invalid
  end

  it "requires an address to be valid" do
    billing_address = BillingAddress.new(billing_name: "Bob", address: nil)

    expect(billing_address).to be_invalid
  end

  it "requires both an address and a name to be valid" do
    billing_address = BillingAddress.new(billing_name: "Bob", address: "123 test street")

    expect(billing_address). to be_valid
  end
end
