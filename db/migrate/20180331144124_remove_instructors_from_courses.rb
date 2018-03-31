class RemoveInstructorsFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :instructors, :string
  end
end
