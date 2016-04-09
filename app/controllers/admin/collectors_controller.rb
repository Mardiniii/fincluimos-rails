class Admin::CollectorsController < ApplicationController
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
end
