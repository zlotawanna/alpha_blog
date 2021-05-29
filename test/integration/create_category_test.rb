require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "John", email: "john@email.com",
                                password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Dessert" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Dessert", response.body
  end
end
