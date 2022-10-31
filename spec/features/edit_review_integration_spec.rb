require 'rails_helper'

describe "edit a review" do



  it "update review info" do
    
    product = Product.create({name: "Cat", cost: 5, country_of_origin: "USA"})
    review = Review.create(author: "Evgeny", content_body: "We love it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast.", rating: 3, product_id: product.id)
    visit products_path
    click_link 'Cat'
    click_link 'Evgeny'
    click_on 'Edit Review'
    fill_in 'Author', :with => "John"
    click_on 'Update Review'
    expect(page) .to have_content 'John'
  end

  #  it("delete product") do
  #   visit new_product_path
  #   product1 = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})
  #   visit product_path(product1)
  #   click_on 'Delete Product'
  #   expect(page) .to have_content 'Products:'
  # end
end