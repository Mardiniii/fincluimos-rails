# == Schema Information
#
# Table name: form_responses
#
#  id         :integer          not null, primary key
#  form_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FormResponse < ActiveRecord::Base
  belongs_to :form, counter_cache: true
  has_many :question_responses, dependent: :destroy

  accepts_nested_attributes_for :question_responses, allow_destroy: true
end
