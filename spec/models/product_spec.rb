require 'rails_helper'

RSpec.describe Product, type: :model do
  it "requires a name to be valid" do
    product = Product.new(name: nil)

    expect(product).to be_invalid
  end

  it "can be linked to a user" do
    product = Product.new(name: "Cookie")
    user = User.create!(email: 'test@test.com', password: 'test123', password_confirmation: 'test123')

    product.user = user

    product.save

    expect((Product.find_by email: 'test@test.com').count).to eq(2)
  end

  it "can be linked to a category" do

  end

  it "the category can be accessed through itself" do
  end

  it "the user can be accessed through itself" do
  end

end
