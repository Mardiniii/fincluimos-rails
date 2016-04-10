class Api::V1::FormResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    form_response_array = form_response_params["form_responses"]
    form_response_array.each do |form_response|
      form_response[:question_responses_attributes] = form_response[:question_responses] || []
      form_response[:question_responses_attributes] = form_response[:question_responses_attributes]
        .map do |qr|
        qr[:question_option_question_responses_attributes] = qr[:question_option_question_responses] || []
        qr.delete(:question_option_question_responses)
        qr
      end
      form_response.delete(:question_responses)
      form_response = FormResponse.new(form_response)
      form_response.save
    end
    head :ok
  end

  private

  def form_response_params
    params.permit(form_responses: [:id, :form_id,
    question_responses: [:id, :form_response_id, :question_id, :question_option_id,
    :text, :_destroy, question_option_question_responses: [:id, :question_option_id,
    :question_response_id, :_destroy]]])
  end

end
