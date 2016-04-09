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

class QuestionOption < ActiveRecord::Base
  belongs_to :question
  has_many :question_option_question_responses
  has_many :question_responses, through: :question_option_question_responses
end
