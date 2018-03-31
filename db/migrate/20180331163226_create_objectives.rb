class CreateObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :objectives do |t|
      t.string :objective
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
