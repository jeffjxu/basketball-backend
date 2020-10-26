require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user, username: "michaeljordan", email: "michaeljordan@gmail.com", firstname: "Michael", lastname: "Jordan", dob: 10.years.ago.to_date)
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_path, params: { firstname: "Michael", lastname: "Jordan", email: "mjordan@gmail.com", username: "mjordan", dob: 10.years.ago.to_date, phone: "1234567890", password: "1234567", password_confirmation: "1234567" }
      assert_response :success
    end
  end

  test "should update user" do
    patch user_path(@user), params: { firstname: @user.firstname, lastname: "Smith", email: @user.email, username: @user.username, dob: @user.dob, phone: @user.phone, password: "1234567", password_confirmation: "1234567" }
    assert_response :success
  end

  test "should show user" do
    get user_path(@user)
    assert_response :success
  end

  test "should destroy owner" do
    assert_difference('User.count', -1) do
      delete user_path(@user)
      assert_response :success
    end
  end
end
