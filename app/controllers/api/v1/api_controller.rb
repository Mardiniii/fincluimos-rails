class Api::V1::ApiController < Api::ApiController

  def current_company
    current_user.try(:company)
  end
  
end
