class AddLengthToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :length, :integer
  end
end
