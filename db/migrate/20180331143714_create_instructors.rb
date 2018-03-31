class CreateInstructors < ActiveRecord::Migration[5.1]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :about_me
      t.string :institute
      t.string :avatar
      t.references :course, foreign_key: true


      t.timestamps
    end
  end
end
