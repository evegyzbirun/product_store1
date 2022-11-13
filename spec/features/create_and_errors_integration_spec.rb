require 'rails_helper'

describe "product" do
  before :each do
    visit signup_path
    User.create!(email: "play@gmail.com", password:"play",password_confirmation:"play", admin: true )
    visit signin_path
    fill_in "email", :with => "play@gmail.com"
    fill_in "password", :with => "play"
    click_button "Sign in"
  end

  it "adds a new product" do
    visit products_path
    click_button 'Create new product'
    fill_in 'Name', :with => 'Giant Fly'
    fill_in 'Cost', :with => 22
    fill_in 'Country of origin', :with => "United States"
    click_on 'Create Product'
    expect(page).to have_content 'Giant Fly'
  end


  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "gives an error when no cost is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Cost can't be blank"
  end

  it "gives an error when no country of origin is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Country of origin can't be blank"
  end
end

describe "review" do
  before :each do
    visit signup_path
    User.create!(email: "play@gmail.com", password:"play",password_confirmation:"play", admin: true )
    visit signin_path
    fill_in "email", :with => "play@gmail.com"
    fill_in "password", :with => "play"
    click_button "Sign in"
  end

  product2 = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})


  it "adds a new review" do
    visit products_path
    visit product_path(product2.id)
    click_button 'Add Review to Product'
    fill_in 'Author', :with => 'Evgeny'
    fill_in 'Content body', :with => "We hate it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs. "
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content 'Evgeny'
  end


  it "gives an error when no author is entered" do
    visit product_path(product2.id)
    visit new_product_review_path(product2.id)
    fill_in 'Author', :with => ''
    fill_in 'Content body', :with => "We hate it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs. "
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "gives an error when no Content body is entered" do
    visit product_path(product2.id)
    visit new_product_review_path(product2.id)
    fill_in 'Author', :with => 'Evgeny'
    fill_in 'Content body', :with => ""
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content "Content body can't be blank"
  end

  it "gives an error when no rating is entered" do
    visit product_path(product2.id)
    visit new_product_review_path(product2.id)
    fill_in 'Author', :with => 'Evgeny'
    fill_in 'Content body', :with => "We hate it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs. "
    fill_in 'Rating', :with => nil
    click_on 'Create Review'
    expect(page).to have_content "Rating can't be blank"
  end

  it "gives an error when Content body is too short" do
    visit product_path(product2.id)
    visit new_product_review_path(product2.id)
    fill_in 'Author', :with => 'Evgeny'
    fill_in 'Content body', :with => "We hate it."
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
  end
end