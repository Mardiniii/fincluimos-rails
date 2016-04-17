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

class FormSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :questions
end
