require "test_helper"

class NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get news_search_url
    assert_response :success
  end
end
