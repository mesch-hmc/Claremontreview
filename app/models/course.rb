class Course < ActiveRecord::Base
  searchkick match: :word_start, searchable: [:code, :title, :instructor]
  has_many :reviews, dependent: :destroy
  validates_presence_of :slug

  def slug
    code.gsub(" ", "_")
  end

  def to_param
    slug
  end

  def full_title
    "#{self.code}: #{self.title}"
  end
end
