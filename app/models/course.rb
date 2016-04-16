class Course < ActiveRecord::Base
  searchkick match: :word_start, searchable: [:code, :title]

  def to_param
    code
  end
end
