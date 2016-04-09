class Api::ApiController < ApplicationController
  include Authenticable
  protect_from_forgery with: :null_session
end
