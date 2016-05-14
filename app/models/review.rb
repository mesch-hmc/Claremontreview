class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :course
  belongs_to :user
  after_save :update_avg_rating

  GRADES = ['A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F','HP','P','NC']

  validates :rating, presence: true, inclusion: 1..5
  validates :grade, presence: true, inclusion: {in: GRADES}
  validates :info, presence: true
  validates :review_text, presence: true

  default_scope -> {order(created_at: :desc)}

  def update_avg_rating
    avg = course.reviews.average(:rating)
    if avg.nil?
      avg = 0.0
    end
    course.update_column(:avg_rating, avg)
  end

  ### Parts of the info attribute ###
  def semester
    !info.nil? ? info.split(' | ')[0].split(' ')[1] : @semester
  end

  def year
    !info.nil? ? info.split(' | ')[0].split(' ')[2] : @year
  end

  def other
    !info.nil? ? info.split(' | ')[1] : @other
  end
end
