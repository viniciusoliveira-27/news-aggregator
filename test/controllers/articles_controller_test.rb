require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_index_url
    assert_response :success
  end

  test "should get create" do
    get articles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get articles_destroy_url
    assert_response :success
  end
end
