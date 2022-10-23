require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_length_of(:name).is_at_most(100) }

  it("has many reviews") do
    product = Product.create(name: "product")
    review1 = Review.create(author: "review1", product_id: product.id)
    review2 = Review.create(author: "review2", product_id: product.id)
    expect(product.reviews()).to(eq([review1, review2]))
  end
end