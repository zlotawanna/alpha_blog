require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @article = Article.create(title: "some title 3", description: "some description")
    @user = User.create(username: "Bill Gates", email: "billgates@email.com",
                                password: "password", admin: false)
  end

#  test "should get index" do
#    get articles_url
#    assert_response :success
#  end

  test "should get new" do
    sign_in_as(@user)
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    sign_in_as(@user)
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: { title: "some title2", description: "some description2" } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should not create article if not login" do
    get new_article_url
    assert_redirected_to login_url
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

#  test "should get edit" do
#    get edit_article_url(@article)
#    assert_response :success
#  end

#  test "should update article" do
#    patch article_url(@article), params: { article: {  } }
#    assert_redirected_to article_url(@article)
#  end

#  test "should destroy article" do
#    assert_difference('Article.count', -1) do
#      delete article_url(@article)
#    end

#    assert_redirected_to articles_url
#  end

end
