require 'rails_helper'

RSpec.describe Category, type: :model do
  it "requires a name to be valid" do
    category = Category.new(name: nil)

    expect(category).to be_invalid
  end

  it "allows a category to choose itself as its category id" do
    category = Category.new(name: "Parent")
    subcategory = Category.new(name: "child")
    subcategory.category = category

    expect(subcategory.category).to be_valid
  end

  it "allows a category to have multiple subcategories" do
    category = Category.create(name: "Parent")
    sub1 = Category.new(name: "child1")
    sub1.category = category
    sub2 = Category.new(name: "child2")
    sub2.category = category
    sub1.save
    sub2.save

    expect(category.subcategories.count).to eq(2)
  end
end
