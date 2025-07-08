require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    post api_v1_signin_path, params: {
      user: {
        email: "test@example.com",
        password: "password123",
        password_confirmation: "password123"
      }
    }
    assert_response :created
  end
end
