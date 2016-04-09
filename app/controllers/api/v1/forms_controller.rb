class Api::V1::FormsController < Api::V1::ApiController
  before_action :authenticate_with_token!

  def index
    render json: { forms: [  ] }, status: :ok
  end

end
