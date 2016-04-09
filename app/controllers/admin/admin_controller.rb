module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!

    def new_info_collector
    end
  end
end
