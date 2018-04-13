class RemoveLengthFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :length, :string
  end
end
