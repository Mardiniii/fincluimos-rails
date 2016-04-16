class Admin::FormsController < ApplicationController

  def index
    @forms = current_company.forms.all
  end

  def new
    @form = current_company.forms.build
    @form.questions.build
    @form.questions.each { |q| q.question_options.build }
  end

  def edit
    @form = current_company.forms.find(params[:id])
    @questions = @form.questions
  end

  def show
    @form = current_company.forms.find(params[:id])
    @form_responses = @form.form_responses
  end

  def create
    @form = current_company.forms.build(form_params)
    if @form.save
      flash[:notice] = "El formulario #{@form.name} fue creado con éxito"
      redirect_to admin_forms_path
    else
      flash[:alert] = "Ha ocurrido un error y el formulario #{@form.name}, no ha sido almacenado"
      render :action => 'new'
    end
  end

  def destroy
    form = current_company.forms.find(params[:id])
    form.destroy
    redirect_to admin_forms_path
  end

  private
    def form_params
      params.require(:form).permit(:name, :description, questions_attributes: [:id, :text, :question_type, :_destroy, question_options_attributes: [:id, :text, :_destroy]])
    end
end
