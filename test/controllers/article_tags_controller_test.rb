require "test_helper"

class ArticleTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get article_tags_create_url
    assert_response :success
  end
end
