class CreateOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :outcomes do |t|
      t.string :outcome
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
