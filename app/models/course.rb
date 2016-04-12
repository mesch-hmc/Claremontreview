class Course < ActiveRecord::Base
  has_many :reviews
  searchkick match: :word_start, searchable: [:code, :title]

  def to_param
    code
  end
end
