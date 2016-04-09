class Admin::CollectorsController < ApplicationController
  before_action :authenticate_user!
  before_filter :company_permission

  def new
    @collector = User.new
  end

  def create
    @collector = User.new(collector_params)
    generated_password = Devise.friendly_token.first(8)
    @collector.password = generated_password
    @collector.company = current_user.company
    @collector.role = 2
    if @collector.save
      flash[:notice] = "El asesor móvil #{@collector.first_name} #{@collector.last_name} fue creado con éxito"
      redirect_to admin_collectors_path
    else
      flash[:alert] = "Ha ocurrido un error y el asesor móvil #{@collector.first_name} #{@collector.last_name}, no ha sido almacenado"
      render :action => 'new'
    end
  end

  def edit
    @collector = User.find(params[:id])
  end

  def update
    @collector = User.find(params[:id])
    if @collector.update(collector_params)
      flash[:notice] = "El asesor móvil #{@collector.first_name} #{@collector.last_name} ha sido editado con éxito"
      redirect_to admin_collectors_path
    else
      flash[:alert] = 'Ha ocurrido un error y el asesor móvil #{@collector.first_name} #{@collector.last_name}, no ha sido editado'
      render 'edit'
    end
  end

  def index
    @collectors = User.where(role: 2)
  end

  def destroy
    @collector = User.find(params[:id])
    @collector.destroy
    redirect_to admin_collectors_path
  end

  private
    def collector_params
      params.require(:user).permit(:first_name, :last_name, :email, :id_number, :avatar)
    end

    def company_permission
      unless current_user.admin?
        redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
      end
    end
end
