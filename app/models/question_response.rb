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

class QuestionResponse < ActiveRecord::Base
  belongs_to :form_response
  belongs_to :question
  belongs_to :question_option

  has_many :question_option_question_responses, dependent: :destroy
  has_many :question_options, through: :question_option_question_responses, dependent: :destroy
  accepts_nested_attributes_for :question_option_question_responses, reject_if: :all_blank, allow_destroy: true
end
