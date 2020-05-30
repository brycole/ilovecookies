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

    expect(product.user.email).to eq("test@test.com")
  end

  it "can be linked to a category" do
    category = Category.create(name: "Filled")
    product = Product.new(name: "Cookie")

    product.category = category
    product.save

    expect(product.category.name).to eq("Filled")
  end
end
