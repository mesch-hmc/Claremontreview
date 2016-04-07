class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :title
      t.text :instructor
      t.float :credits
      t.text :description
      t.text :requirements
      t.text :term

      t.timestamps null: false
    end
  end
end
