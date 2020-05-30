# seed file

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

cookie_categories = %w[Bar Drop Filled Rolled Sandwich]

bar_cat = %w[Chocolate Almond Christmas Lemon]
drop_cat = %w[Chocolate Almond Cranberry Oatmeal]
filled_cat = %w[Chocolate Cherry Raisin]
rolled_cat = %w[Sugar Fruit Ginger Christmas]
sandwich_cat = %w[Chocolate Ginger Blueberry]
child_cat = [bar_cat, drop_cat, filled_cat, rolled_cat, sandwich_cat]

puts 'Baking initial cookies categories...'
categories = []
cookie_categories.each do |name|
  categories << Category.create!(name: name)
end

puts 'Adding filling to each cookie category...'

categories.each_with_index do |category, index|
  child_cat[index].each do |name|
    # puts "Adding flavor #{name} to #{category}"
    name = Category.new(name: name)
    name.category = category
    name.save
  end
end

puts 'Baking the cookies...'
bar_almond = Product.new(
  name: 'Almond Toffee Bar Cookies',
  description: 'Almond Toffee Bar Cookies are an absolutely luscious layer bar cookie – one that looks incredibly elegant but is super easy to make, with just 7 ingredients.',
  price: 1.5,
  availability_date: Date.today,
  active_status: true,
  category: Category.find_by(name: 'Almond', category: categories[0])
  )
bar_almond.save

bar_choc = Product.new(
  name: 'Chocolate-Cherry Bars',
  description: '“They’re such a surprise,” said a friend when she tasted Chocolate-Cherry Bars. What looks like a frosted brownie explodes with flavor from the marriage of chocolate with cherry.',
  price: 1.75,
  availability_date: Date.today,
  active_status: true,
  category: Category.find_by(name: 'Chocolate', category: categories[0])
  )
bar_choc.save

bar_christmas = Product.new(
  name: 'Christmas Magic Cookie Bars',
  description: 'Christmas Magic Cookie Bars are a variation of the classic one-pan bar cookie, first debuted in the 1960s and have been immensely popular ever since.',
  price: 1.35,
  availability_date: Date.today,
  active_status: true,
  category: Category.find_by(name: 'Christmas', category: categories[0])
  )
bar_christmas.save

bar_lemon = Product.new(
  name: 'Lemon Bars',
  description: 'Lemon Bars are an iconic combination of tart and sweet in one bar cookie.',
  price: 1.55,
  availability_date: Date.today,
  active_status: true,
  category: Category.find_by(name: 'Lemon', category: categories[0])
  )
bar_lemon.save

product_description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi iaculis ex in quam suscipit ultrices."
adjective = %w[Ultimate Delicious Luscious Delightful Heavenly Mouthwatering Tasty]
# flavor = %w[Almond Lemon Cherry Christmas Oatmeal Raisin Sugar Fruit Ginger Blueberry]
price = [1.25, 1.99, 1.5, 1.75, 2, 2.5, 3, 3.25]
15.times {
  main_cat = categories.sample
  sub_cat = eval("#{main_cat.name.downcase}_cat").sample
  build_name = "#{adjective.sample} #{sub_cat} Cookies"
  Product.create(
    name: build_name,
    description: product_description,
    price: price.sample,
    availability_date: Date.today,
    active_status: true,
    category: Category.find_by(name: sub_cat, category: main_cat.id)
    )
  # puts main_cat.name
  # puts build_name
}
