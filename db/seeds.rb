# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
def convert_headers(header)
  if header == "Product"
    header = "name"
  elsif  header == "Available"
    header = "inventory"
  elsif header == "category"
    header == ""
  else
    header.downcase
  end
end

def convert_data(data)
  if data.include?(":")
    data = data.split(":")[1]
  end
  if data == "Bands"
    data = "Music"
  end
  data
end


csv = CSV.foreach("app/assets/CSVs/Iron_Glory_Inventory.csv", headers: true, converters: lambda{|h| convert_data(h)}, header_converters: lambda {|h| convert_headers(h)})
csv.each do |row|
  row = row.to_hash
  puts category = row.delete("category")
  product = Product.new(row.to_hash)
  product.category = Category.find_or_create_by!(name: category)
  product.save!
  File.open("app/assets/images/iron-glory-products/igp#{product.id}.png", "rb") do |file|
    product.product_image = file
  end
  product.save!
end

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(
  firstname: first_name,
  lastname: last_name,
  email: Faker::Internet.email,
  password: "espn",
  username: Faker::Internet.user_name("#{first_name} #{last_name}", %w(- _))
  )
end


15.times do
  shipping_address = ShippingAddress.new(street_address: Faker::Address.street_address + " " + Faker::Address.street_suffix, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
  shipping_address.can_be_shipped_to = User.all.sample
  shipping_address.save!
end

10.times do
  billing_address = BillingAddress.new(street_address: Faker::Address.street_address + " " + Faker::Address.street_suffix, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code)
  billing_address.can_be_billed = User.includes(:shipping_addresses).where.not(:shipping_addresses => {can_be_shipped_to_id: nil}).sample
  billing_address.save!
end


20.times do
  order = Order.new(order_number: SecureRandom.hex(10))
  user =
User.includes(:billing_addresses).where.not(:billing_addresses => {can_be_billed: nil}).sample
  order.can_order = user
  order.shipping_address = user.shipping_addresses.first
  order.billing_address = user.billing_addresses.first
  order.save!
  3.times do
    ordering = Ordering.new
    ordering.product = Product.all.sample
    ordering.quantity = (1..4).to_a.sample
    order.orderings << ordering
  end
  order.save!
end

Ordering.where(order: nil).each do |ordering|
  puts "fixing"
  ordering.order_id = 15
  ordering.save!
end
