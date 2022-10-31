require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_length_of(:name).is_at_most(100) }

  it("has many reviews") do
    product = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})

    review1 = Review.create(author: "review12", content_body: "We love it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs.", rating: 3, product_id: product.id)

    review2 = Review.create(author: "review22", content_body: "We hate it. You know the Grammys are a joke when Future doesn't win Best EverythingNorth America should be called Russia since people are always moving so fast. GraliticaYou say potatoe, I say starchy carbs. ", rating: 1, product_id: product.id)
    expect(product.reviews()).to(eq([review1, review2]))
  end

  it("enter name of an product and it will be titled") do
    product = Product.create({name: "giant steps", cost: 5, country_of_origin: "USA"})
    expect(product.name()).to(eq("Giant Steps"))
  end
end