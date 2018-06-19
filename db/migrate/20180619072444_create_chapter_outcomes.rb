class CreateChapterOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_outcomes do |t|
      t.bigint :course_id
      t.string :chname
      t.string :outcome
      t.references :chapter, foreign_key: true
      t.references :outcome, foreign_key: true

      t.timestamps
    end
  end
end
