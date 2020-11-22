require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @user = FactoryBot.create(:user, username: "michaeljordan1", email: "michaeljordan@gmail.com", firstname: "Michael", lastname: "Jordan", dob: 10.years.ago.to_date)
  #   @game = FactoryBot.create(:game, name: "game12", date: Date.current, time: Time.current, description: "a basketball game 1", private: false, longitude: 0.0, latitude: 0.0)
  #   @player = FactoryBot.create(:player, status: "going", user: @user, game: @game)
  # end

  # test "should get index" do
  #   get players_path
  #   assert_response :success
  # end

  # test "should update player" do
  #   patch player_path(@player), params: { status: "maybe", user_id: @user.id, game_id: @game.id }
  #   assert_response :success
  # end

  # test "should show player" do
  #   get player_path(@player)
  #   assert_response :success
  # end

  # test "should destroy player" do
  #   assert_difference('Player.count', -1) do
  #     delete player_path(@player)
  #     assert_response :success
  #   end
  # end
end