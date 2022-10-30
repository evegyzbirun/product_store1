require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
# Review.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.dish,
                        cost: Faker::Number.decimal(l_digits: 2),
                        country_of_origin: Faker::Address.country)
end

p "Created #{Product.count} products"

 250.times do |index2|
   Review.create!(author: Faker::Name.first_name,                  
                  content_body: Faker::Alphanumeric.alphanumeric(number: 70),
                   rating: Faker::Number.between(from: 1, to: 5))
 end

 p "Created #{Review.count} reviews"