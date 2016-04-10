class Api::V1::FormResponsesController < ApplicationController

  def create
    form_response = FormResponse.new(form_response_params)
    if form_respone.save
      render json: form_response
    else
      render json: {success: false, errors: form_response.errors}, status: 422
    end
  end

  private

  def form_response_params
    params.require(:form_response).permit(:id, :form_id, question_responses_attributes: [:id, :form_response_id, :question_id, :question_option_id, :text, :_destroy, question_option_question_responses_attributes: [:id, :question_option_id, :question_response_id, :_destroy]])
  end

end
