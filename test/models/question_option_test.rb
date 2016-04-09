# == Schema Information
#
# Table name: question_options
#
#  id          :integer          not null, primary key
#  question_id :integer
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class QuestionOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
