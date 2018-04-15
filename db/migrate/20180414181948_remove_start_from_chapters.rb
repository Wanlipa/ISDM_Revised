class RemoveStartFromChapters < ActiveRecord::Migration[5.1]
  def change
    remove_column :chapters, :start, :string
  end
end
