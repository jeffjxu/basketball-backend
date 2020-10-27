require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  # Test relationships
  should belong_to :user
  should belong_to :game

  # Test validations
  # Required field validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:game_id)
  should validate_presence_of(:status)

  # Status validation
  should allow_value("invited").for(:status)
  should allow_value("going").for(:status)
  should allow_value("maybe").for(:status)
  should_not allow_value("test").for(:status)
  should_not allow_value(1).for(:status)

  context "Given context" do
    setup do
      create_users
      create_games
      create_players
    end

    teardown do
      destroy_players
      destroy_games
      destroy_users
    end

    should "get all players of invited status" do
      assert_equal 2, Player.invited.size
      # assert_equal [1, 3], Player.invited.map{ |p| p.user_id }.sort
    end

    should "get all players of going status" do
      assert_equal 1, Player.going.size
      # assert_equal [1], Player.going.map{ |p| p.user_id }
    end

    should "get all players of maybe status" do
      assert_equal 2, Player.maybe.size
      # assert_equal [1, 2], Player.maybe.map{ |p| p.user_id }.sort
    end

    should "get all players for game1" do
      assert_equal 3, Player.for_game(@game1.id).size
      # assert_equal [1, 2, 3], Player.for_game(@game1.id).map{ |p| p.user_id }.sort
    end

    should "get all players for user1" do
      assert_equal 3, Player.for_user(@user1.id).size
      # assert_equal [1, 2, 3], Player.for_user(@user1.id).map { |p| p.game_id }.sort
    end
  end
end
