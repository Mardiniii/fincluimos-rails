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

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question_type, :text

  has_many :question_options
end
