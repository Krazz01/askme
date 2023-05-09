class AddColumnsNavcolorToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :navcolor, :string, null: false, default: '#370617'
  end
end
