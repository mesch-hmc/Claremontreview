class AddGradeToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :grade, :string
  end
end
