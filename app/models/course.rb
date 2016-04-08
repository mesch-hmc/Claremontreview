class Course < ActiveRecord::Base
  def to_param
    code
  end
end
