class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :rating, presence: true, :inclusion => 0..5
  validates :grade, presence: true
  validates :info, presence: true
  validates :review_text, presence: true

  default_scope -> { order(created_at: :desc)}
end
