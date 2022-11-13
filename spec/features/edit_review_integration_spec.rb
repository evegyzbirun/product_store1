require 'rails_helper'

describe "edit a review" do
  before:each do
    
      visit signup_path
      User.create!(email: "play@gmail.com", password:"play",password_confirmation:"play", admin: true )
      visit signin_path
      fill_in "email", :with => "play@gmail.com"
      fill_in "password", :with => "play"
      click_button "Sign in"
   

    product = Product.create({name: 'niant steps', cost: 5, country_of_origin: "USA"})
    review = Review.create({author: 'Evgeny', content_body: "We love it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs.", rating: 3, product_id: product.id})
    visit products_path
    
    first(:link, 'Niant Steps').click 
    first(:link, 'Evgeny').click
    
  end







  it 'edit a review' do
    click_on 'Edit Review'
    fill_in 'Author', :with => 'John'
    click_on 'Update Review'
    expect(page) .to have_content 'John'
  end

  it 'detele a review' do 
    click_on 'Delete Review'
    expect(page) .to have_content 'Niant Steps'
  end
end