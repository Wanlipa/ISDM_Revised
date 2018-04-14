class CreateMaintopics < ActiveRecord::Migration[5.1]
  def change
    create_table :maintopics do |t|
      t.string :name
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
