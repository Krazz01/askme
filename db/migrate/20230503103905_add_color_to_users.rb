class AddColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :color, :text, default: 370617
  end
end
