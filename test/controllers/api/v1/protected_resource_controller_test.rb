require "test_helper"

class Api::V1::ProtectedResourceControllerTest < ActionDispatch::IntegrationTest
  test "should require authentication for index" do
    get api_v1_protected_resource_index_path(format: :json)
    assert_response :unauthorized
  end
end
