# == Schema Information
#
# Table name: forms
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Form < ActiveRecord::Base
  belongs_to :company
  has_many :questions
  has_many :form_responses

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
