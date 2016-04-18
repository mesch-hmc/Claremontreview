class Course < ActiveRecord::Base
  searchkick match: :word_start, searchable: [:code, :title, :instructor]
  has_many :reviews, dependent: :destroy

  def to_param
    code
  end
end
