class RemoveEndFromChapters < ActiveRecord::Migration[5.1]
  def change
    remove_column :chapters, :end, :string
  end
end
