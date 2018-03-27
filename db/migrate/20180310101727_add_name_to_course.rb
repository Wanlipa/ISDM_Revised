class AddNameToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :courseName, :string
  end
end
