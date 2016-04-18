class AddImageColumnsToQuestionResponses < ActiveRecord::Migration
  def up
    add_attachment :question_responses, :image
  end

  def down
    remove_attachment :question_responses, :image
  end
end
