class CreateChapterOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_outcomes do |t|
      t.string :choutcome
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
