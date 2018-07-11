class AddProfileToInstructors < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :profile, :string
  end
end
