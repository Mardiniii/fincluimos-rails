class Admin::FormResponsesController < ApplicationController
  def show
    @form_response = current_company.form_responses.find(params[:id])
  end
end
