class CreateProblemSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :problem_solutions do |t|
      t.string :problem
      t.string :solution
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
