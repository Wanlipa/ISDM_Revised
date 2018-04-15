class AddTimeToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :time, :integer
  end
end
