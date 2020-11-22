require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @user1 = FactoryBot.create(:user, username: "michaeljordan", email: "michaeljordan@gmail.com", firstname: "Michael", lastname: "Jordan", dob: 10.years.ago.to_date)
  #   @user2 = FactoryBot.create(:user, username: "kobebryant", email: "kobebryant@gmail.com", firstname: "Kobe", lastname: "Bryant", dob: 12.years.ago.to_date)
  #   @favorite = FactoryBot.create(:favorite, favoriter: @user2, favoritee: @user1)
  # end

  # test "should get index" do
  #   get favorites_path
  #   assert_response :success
  # end

  # test "should create favorite" do
  #   assert_difference('Favorite.count') do
  #     post favorites_path, params: { favoriter_id: @user1.id, favoritee_id: @user2.id }
  #     assert_response :success
  #   end
  # end

  # test "should show favorite" do
  #   get favorite_path(@favorite)
  #   assert_response :success
  # end

  # test "should destroy favorite" do
  #   assert_difference('Favorite.count', -1) do
  #     delete favorite_path(@favorite)
  #     assert_response :success
  #   end
  # end
end