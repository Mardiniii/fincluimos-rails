class AdjustUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_reference :users, :company
  end
end
