# seed file

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

cookie_categories = %w[Bar Drop Filled Rolled Sandwich]

bar_cat = %w[Chocolate Almond Christmas Lemon]
drop_cat = %w[Chocolate Almond Cranberry Oatmeal]
filled_cat = %w[Chocolate Cherry Raisin]
rolled_cat = %w[Sugar Fruit Ginger Christmas]
sandwich_cat = %w[Chocolate Ginger Blueberry]
child_cat = [bar_cat, drop_cat, filled_cat, rolled_cat, sandwich_cat]

# puts child_cat
# puts child_cat[0]

puts 'Baking initial cookies categories...'
categories = []
cookie_categories.each do |name|
  categories << Category.create!(name: name)
end

# puts categories
# puts categories[0]
# puts categories.class

puts 'Adding filling to each cookie category...'

categories.each_with_index do |category, index|
  child_cat[index].each do |name|
    # puts "Adding flavor #{name} to #{category}"
    name = Category.new(name: name)
    name.category = category
    name.save
  end
end
