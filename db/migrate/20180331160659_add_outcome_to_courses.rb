class AddOutcomeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :outcome, :string
  end
end
