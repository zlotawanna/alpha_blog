require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test "get signup form and create new user" do
    get "/signup"
    assert_response :success
    assert_difference('User.count', 1) do
      post users_url, params: { user: { username: "john",
        email: "john@adress.com", password: "password" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "john", response.body
  end

end
