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

require 'test_helper'

class QuestionOptionQuestionResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
