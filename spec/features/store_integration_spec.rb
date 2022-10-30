require 'rails_helper'

describe "product " do
  it "adds a new product" do
    visit products_path
    click_button 'Create new product'
    fill_in 'Name', :with => 'Giant Fly'
    fill_in 'Cost', :with => 22
    fill_in 'Country of origin', :with => "United States"
    click_on 'Create Product'
    # expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Giant Fly'
  end
end