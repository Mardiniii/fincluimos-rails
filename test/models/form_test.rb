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

require 'test_helper'

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
