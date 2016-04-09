# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  form_id       :integer
#  question_type :integer
#  text          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
