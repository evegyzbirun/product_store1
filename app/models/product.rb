class Product < ApplicationRecord
  
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_product)


  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_tasks, -> {(
    select("products.id, products.name, products.role, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(3)
    )}

    scope :name, -> (name_parameter) { where(name: name_parameter) } 
  private
    def titleize_product
      self.name = self.name.titleize
    end

    # def sort three most recently added products

    # The product with the most reviews.

    # All products made in the USA for buyers that want to buy local products.

    # also touch erbs
end