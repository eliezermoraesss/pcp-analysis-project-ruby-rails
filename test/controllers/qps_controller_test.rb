require "test_helper"

class QpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get qps_index_url
    assert_response :success
  end
end
