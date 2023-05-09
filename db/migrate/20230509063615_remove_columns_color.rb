class RemoveColumnsColor < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :color
  end
end
