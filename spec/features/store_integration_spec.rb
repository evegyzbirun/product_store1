require 'rails_helper'

describe "product" do
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
end

describe "review" do
  it "adds a new review" do
    visit products_path
    product2 = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})
    visit product_path(product2.id)
    click_button 'Add Review to Product'
    fill_in 'Author', :with => 'Evgeny'
    fill_in 'Content body', :with => "We hate it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs. "
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content 'Evgeny'
  end
end