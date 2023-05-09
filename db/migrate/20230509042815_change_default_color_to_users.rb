class ChangeDefaultColorToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :color, :string, null: false, default: '#370617'
  end
end
