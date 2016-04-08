class Course < ActiveRecord::Base
  searchkick

  def to_param
    code
  end
end
