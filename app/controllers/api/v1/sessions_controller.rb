class Api::V1::SessionsController < ApplicationController
  # POST /api/v1/sessions
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = generate_token(user)
      render json: {
        user: { id: user.id, email: user.email },
        token: token
      }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def generate_token(user)
    payload = user.to_token_payload
    JWT.encode(payload, Rails.application.credentials.secret_key_base, "HS256")
  end
end
