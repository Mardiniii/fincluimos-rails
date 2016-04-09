class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :company_type

      t.timestamps null: false
    end
  end
end
