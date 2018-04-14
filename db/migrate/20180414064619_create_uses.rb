class CreateUses < ActiveRecord::Migration[5.1]
  def change
    create_table :uses do |t|
      t.integer :time
      t.references :material, foreign_key: true
      t.references :subtopic, foreign_key: true

      t.timestamps
    end
  end
end
