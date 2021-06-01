require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "John", email: "john@adress.com", password: "password")
  end

  test "username and email should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(username: "john")
    assert_not @user2.valid?
  end

  test "username should not be too short" do
    @user.username = "aa"
    assert_not @user.valid?
  end

  test "username shouldn't be too long" do
    @user.username = "a" * 26
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @user2 = User.new(username: "Thomas", email: "John@adress.com")
    assert_not @user2.valid?
  end

  test "email shouldn't be too long" do
    @user.email = "a" * 100 + "@adress.com"
    assert_not @user.valid?
  end

  test "email should have correct format - @" do
    @user.email = "name.adress.com"
    assert_not @user.valid?
  end

  test "email should have correct format - dot" do
    @user.email = "name@adress"
    assert_not @user.valid?
  end

  test "email should have correct format - name" do
    @user.email = "@adress.com"
    assert_not @user.valid?
  end

end
