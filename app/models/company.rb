# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string
#  company_type :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :forms, dependent: :destroy
  has_many :form_responses, through: :forms

  enum  company_type: [:bank, :cooperative, :government, :ngo]
end
