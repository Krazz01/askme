class ChangeColumnHidden < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :hidden, :boolean, null: false, default: false
  end
end
