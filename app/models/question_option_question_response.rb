# == Schema Information
#
# Table name: question_option_question_responses
#
#  id                   :integer          not null, primary key
#  question_option_id   :integer
#  question_response_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class QuestionOptionQuestionResponse < ActiveRecord::Base
  belongs_to :question_option
  belongs_to :question_response
end
