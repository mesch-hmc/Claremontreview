class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  GRADES = ['A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F','PASS','FAIL','NC']

  validates :rating, presence: true, inclusion: 0..5
  validates :grade, presence: true, inclusion: {in: GRADES}
  validates :info, presence: true
  validates :review_text, presence: true

  default_scope -> { order(created_at: :desc)}
end
