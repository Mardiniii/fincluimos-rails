class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :form, index: true, foreign_key: true
      t.integer :question_type
      t.text :text

      t.timestamps null: false
    end
  end
end
