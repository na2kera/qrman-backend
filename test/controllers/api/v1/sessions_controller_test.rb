require "test_helper"

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should create session with invalid credentials" do
    post api_v1_login_path, params: {
      email: "nonexistent@example.com",
      password: "wrongpassword"
    }
    assert_response :unauthorized
  end
end
