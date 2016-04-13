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
  accepts_nested_attributes_for :question_option_question_responses, allow_destroy: true


  def to_s
    case self.question.question_type.to_sym
    when :input, :text
      self.text if self.text
    when :dropdown
      self.question_option.text if self.question_option.text
    when :checkbox
      self.question_options.pluck(:text).join(',') if self.question_options
    end
  end
end
