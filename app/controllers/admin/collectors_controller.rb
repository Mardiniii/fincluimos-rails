class Admin::CollectorsController < ApplicationController
  def new
    @collector = User.new
  end

  def edit
  end

  def index
    @collectors = User.where(status: 2)
  end
end
