require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
Review.destroy_all
User.destroy_all

 42.times do |index|
  
  product =  Product.create!(name: Faker::Food.dish,
                          cost: Faker::Number.decimal(l_digits: 2),
                          country_of_origin: Faker::Address.country)

5.times do |index|
   Review.create!(author: Faker::Name.first_name,                  
                  content_body: Faker::Alphanumeric.alphanumeric(number: 70),
                   rating: Faker::Number.between(from: 1, to: 5),
                   product_id: product.id )
end
 end

 5.times do |index|
  
  product =  Product.create!(name: Faker::Food.dish,
                          cost: Faker::Number.decimal(l_digits: 2),
                          country_of_origin: Faker::Address.country_by_code(code: 'US'))

5.times do |index|
   Review.create!(author: Faker::Name.first_name,                  
                  content_body: Faker::Alphanumeric.alphanumeric(number: 70),
                   rating: Faker::Number.between(from: 1, to: 5),
                   product_id: product.id )
end
 end

 3.times do |index|
  
  product =  Product.create!(name: Faker::Food.dish,
                          cost: Faker::Number.decimal(l_digits: 2),
                          country_of_origin: Faker::Address.country_by_code(code: 'US'))

7.times do |index|
   Review.create!(author: Faker::Name.first_name,                  
                  content_body: Faker::Alphanumeric.alphanumeric(number: 70),
                   rating: Faker::Number.between(from: 1, to: 5),
                   product_id: product.id )
end
 end



#  create_table :users do |t|
#    t.column :email, :string
#    t.column :password_hash, :string
#    t.column :password_salt, :string
#    t.column(:admin, :boolean)



# p "Created #{User.count} users"
 p "Created #{Product.count} products"
 p "Created #{Review.count} reviews"