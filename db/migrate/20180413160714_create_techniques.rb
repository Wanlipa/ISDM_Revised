class CreateTechniques < ActiveRecord::Migration[5.1]
  def change
    create_table :techniques do |t|
      t.string :name
      t.references :outcome, foreign_key: true

      t.timestamps
    end
  end
end
