class AddLearningToOutcomes < ActiveRecord::Migration[5.1]
  def change
    add_column :outcomes, :learning, :string
  end
end
