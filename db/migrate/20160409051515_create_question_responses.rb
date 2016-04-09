class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.references :form_response, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :question_option, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
