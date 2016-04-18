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
  has_attached_file :image, styles: { medium: "300x300>", thumb: "242x200#", mini_thumb: "100x100#" }, default_url: "http://i592.photobucket.com/albums/tt5/Mardini03/imagen-no-disponible.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :form_response
  belongs_to :question
  belongs_to :question_option

  has_many :question_option_question_responses, dependent: :destroy
  has_many :question_options, through: :question_option_question_responses, dependent: :destroy
  accepts_nested_attributes_for :question_option_question_responses, allow_destroy: true

  before_save :process_image

  def to_s
    case self.question.question_type.to_sym
    when :input, :text
      self.text || ''
    when :dropdown
      self.question_option.try(:text) || ''
    when :checkbox
      self.question_options ? self.question_options.pluck(:text).join(',') : ''
    when :image
      #TODO: implement image to_s
      ''
    else
      ''
    end
  end

  def process_image

    if self.question.image? && self.text
      regexp = /\Adata:([-\w]+\/[-\w\+\.]+)?;base64,(.*)/m
      data_uri_parts = self.text.match(regexp) || []
      extension = MIME::Types[data_uri_parts[1]].first.preferred_extension
      file_name = SecureRandom.hex
      data = StringIO.new(Base64.decode64(data_uri_parts[2]))
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = file_name
      data.content_type = extension
      self.image = data
    end
  end

end
