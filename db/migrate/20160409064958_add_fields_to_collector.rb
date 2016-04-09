class AddFieldsToCollector < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :id_number, :string
  end
end
