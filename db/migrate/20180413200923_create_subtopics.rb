class CreateSubtopics < ActiveRecord::Migration[5.1]
  def change
    create_table :subtopics do |t|
      t.string :name
      t.references :maintopic, foreign_key: true

      t.timestamps
    end
  end
end
