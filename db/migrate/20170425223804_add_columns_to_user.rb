class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cats,     :boolean, default: false
    add_column :users, :children, :boolean, default: false
    add_column :users, :energy,   :integer, default: 1
  end
end
