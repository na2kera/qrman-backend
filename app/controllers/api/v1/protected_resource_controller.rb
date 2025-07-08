class Api::V1::ProtectedResourceController < ApplicationController
  before_action :authenticate_user!

  # GET /api/v1/protected_resource
  def index
    render json: {
      message: "You are authenticated",
      user: {
        id: current_user.id,
        email: current_user.email
      }
    }
  end
end
