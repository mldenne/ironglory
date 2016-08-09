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
  data
end

csv = CSV.foreach("app/assets/CSVs/Iron_Glory_Inventory.csv", headers: true, converters: lambda{|h| convert_data(h)}, header_converters: lambda {|h| convert_headers(h)})
csv.each do |row|
  row = row.to_hash
  puts category = row.delete("category")
  product = Product.create!(row.to_hash)
  product.category = Category.find_or_create_by!(name: category)
  product.save!
end
