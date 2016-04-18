# == Schema Information
#
# Table name: forms
#
#  id                   :integer          not null, primary key
#  company_id           :integer
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  description          :text
#  form_responses_count :integer          default(0)
#

class Form < ActiveRecord::Base
  belongs_to :company
  has_many :questions, dependent: :destroy
  has_many :form_responses, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
