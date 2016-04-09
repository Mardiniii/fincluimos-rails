class Admin::FormsController < ApplicationController
  def new
    @form = Form.new
    @form.questions.build
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = "El formulario #{@form.name} fue creado con éxito"
      redirect_to admin_forms_path
    else
      flash[:alert] = "Ha ocurrido un error y el formulario #{@form.name}, no ha sido almacenado"
      render :action => 'new'
    end
  end

  def edit
  end

  def index
  end

  private
    def form_params
      params.require(:form).permit(:name, questions_attributes: [:id, :text, :question_type, :_destroy, question_options_attributes: [:id, :text, :_destroy])
    end
end
