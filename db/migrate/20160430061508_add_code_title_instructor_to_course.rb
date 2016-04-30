class AddCodeTitleInstructorToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :code_title_instructor, :text
  end
end
