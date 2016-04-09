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

class Question < ActiveRecord::Base
  belongs_to :form
end
