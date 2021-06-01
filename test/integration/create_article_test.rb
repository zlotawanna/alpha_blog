require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "John", email: "john@email.com",
                                password: "password")
    sign_in_as(@user)
  end

  test "get new article form and create new article" do
    get '/articles/new'
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "New article title", description: "Description of new article"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "New article title", response.body
  end

end
