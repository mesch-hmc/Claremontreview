class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :rank
      t.integer :rating
      t.text :date
      t.text :info
      t.text :review_text

      t.timestamps null: false
    end
  end
end
