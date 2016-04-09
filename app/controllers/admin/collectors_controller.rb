class Admin::CollectorsController < ApplicationController
  before_action :authenticate_user!
  before_filter :content_permission

  def new
    @collector = User.new
  end

  def edit
  end

  def create
    @collector = User.new(collector_params)
    generated_password = Devise.friendly_token.first(8)
    @collector.password = generated_password
    if @collector.save
      flash[:notice] = "El asesor móvil #{@collector.first_name} #{@collector.last_name} fue creado con éxito"
      redirect_to admin_collectors_path
    else
      flash[:alert] = "Ha ocurrido un error y el asesor móvil #{@collector.first_name} #{@collector.last_name}, no ha sido almacenado"
      render :action => 'new'
    end
  end

  def index
    @collectors = User.where(status: 2)
  end

  private
    def collector_params
      params.require(:user).permit(:first_name, :last_name, :email, :id_number)
    end

    def company_permission
      unless current_user.admin?
        redirect_to root_path, :alert => "Lo sentimos, usted no posee permisos de administrador para acceder a esta ruta."
      end
    end
end
