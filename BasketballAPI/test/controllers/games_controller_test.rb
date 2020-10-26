require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = FactoryBot.create(:game, name: "game1", date: Date.current, time: Time.current, description: "a basketball game 1", private: false, longitude: 0.0, latitude: 0.0)
  end

  test "should get index" do
    get games_path
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_path, params: { name: "game1", date: Date.current, time: Time.current, description: "a basketball game 1", private: false, longitude: 0.0, latitude: 0.0 }
      assert_response :success
    end
  end

  test "should update game" do
    patch game_path(@game), params: { name: "game1", date: Date.current, time: Time.current, description: "a basketball game 1", private: false, longitude: 0.0, latitude: 0.1 }
    assert_response :success
  end

  test "should show game" do
    get game_path(@game)
    assert_response :success
  end
end
