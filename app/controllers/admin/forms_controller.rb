class Admin::FormsController < ApplicationController
  def new
    @form = Form.new
    @form.questions.build
  end

  def edit
  end

  def index
  end

  private
    def form_params
      params.require(:form).permit(:name, questions_attributes: [:id, :text, :_destroy])
    end
end
