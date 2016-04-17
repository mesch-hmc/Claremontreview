class Review < ActiveRecord::Base
  belongs_to :course

  validates :rating, presence: true
  validates :rating, :inclusion => 0..5
  validates :info, presence: true
  validates :review_text, presence: true
end
