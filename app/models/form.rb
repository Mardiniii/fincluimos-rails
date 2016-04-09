# == Schema Information
#
# Table name: forms
#
#  id         :integer          not null, primary key
#  company_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Form < ActiveRecord::Base
  belongs_to :company
  has_many :questions
  has_many :form_responses
end
