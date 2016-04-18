class Admin::FormResponsesController < ApplicationController
  def show
    @form_response = FormResponse.find(params[:id])
    @form_questions = @form_response.form.questions
  end
end
