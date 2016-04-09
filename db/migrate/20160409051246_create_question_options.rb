class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.references :question, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
