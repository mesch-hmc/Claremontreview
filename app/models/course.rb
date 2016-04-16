class Course < ActiveRecord::Base
  searchkick match: :word_start, searchable: [:code, :title]
  has_many :reviews, dependent: :destroy

  def to_param
    code
  end
end
