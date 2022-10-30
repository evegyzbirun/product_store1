class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, minimum: 50, maximum: 250

  scope :most_products, -> {(
    select("workers.id, workers.name, workers.role, count(tasks.id) as tasks_count")
    .joins(:tasks)
    .group("workers.id")
    .order("tasks_count DESC")
    .limit(10)
    )}

  # All fields should be filled out, including rating.

  # Rating can only be an integer between 1 and 5. DONE !!!!!!!
  
  # also touch erbs
end