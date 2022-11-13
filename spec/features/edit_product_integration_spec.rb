require 'rails_helper'

describe "edit a product" do
  before :each do
    visit signup_path
    User.create!(email: "play@gmail.com", password:"play",password_confirmation:"play", admin: true )
    visit signin_path
    fill_in "email", :with => "play@gmail.com"
    fill_in "password", :with => "play"
    click_button "Sign in"
  end


  it "update product info" do
    visit new_product_path
    product = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})
    visit edit_product_path(product)
    fill_in 'Name', :with => 'Man run'
    click_on 'Update Product'
    expect(page) .to have_content 'Man Run'
  end

   it("delete product") do
    visit new_product_path
    product1 = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})
    visit product_path(product1)
    click_on 'Delete Product'
    expect(page) .to have_content 'Products:'
  end
end