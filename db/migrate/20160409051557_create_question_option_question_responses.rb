class CreateQuestionOptionQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_option_question_responses do |t|
      t.references :question_option, index: {name: "index_qo_qr"}, foreign_key: true
      t.references :question_response, index: {name: "index_qr_qo"}, foreign_key: true

      t.timestamps null: false
    end
  end
end
