# == Schema Information
#
# Table name: question_responses
#
#  id                 :integer          not null, primary key
#  form_response_id   :integer
#  question_id        :integer
#  question_option_id :integer
#  text               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class QuestionResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
