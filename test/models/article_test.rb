require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: "some title", description: "some description")
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title should not be too short" do
    @article.title = "a" * 5
    assert_not @article.valid?
  end

  test "title should not be too long" do
    @article.title = "a" * 101
    assert_not @article.valid?
  end

  test "description should be present" do
    @article.description = " "
    assert_not @article.valid?
  end

  test "description should not be too short" do
    @article.description = "a" * 9
    assert_not @article.valid?
  end

  test "description should not be too long" do
    @article.description = "a" * 300
    assert_not @article.valid?
  end

end
