require 'test_helper'

class GameTest < ActiveSupport::TestCase
  
  # Test relationships
  should have_many(:players)

  # Test validations
  # Required field validations
  should validate_presence_of(:name)
  should validate_presence_of(:date)
  should validate_presence_of(:time)
  should validate_presence_of(:longitude)
  should validate_presence_of(:latitude)

  # Boolean validations
  should allow_value(true).for(:private)
  should allow_value(false).for(:private)

  # Numericality validations
  should validate_numericality_of(:longitude)
  should validate_numericality_of(:latitude)

  # Date validations
  should allow_value(Date.current).for(:date)
  should allow_value(1.day.from_now.to_date).for(:date)
  should_not allow_value(1.day.ago.to_date).for(:date)
  should_not allow_value("date").for(:date)
  should_not allow_value(123).for(:date)

  # Time validations
  should allow_value(Time.current).for(:time)
  should_not allow_value("time").for(:time)
  should_not allow_value(123).for(:time)

  context "Given context" do
    setup do
      create_games
    end

    teardown do
      destroy_games
    end

    should "get all public games" do
      assert_equal 2, Game.public_games.size
      assert_equal ["game1", "game2"], Game.public_games.map{ |g| g.name }.sort
    end

    should "get all private games" do
      assert_equal 1, Game.private_games.size
      assert_equal ["game3"], Game.private_games.map{ |g| g.name }.sort
    end

    should "get all games between today and tomorrow" do
      assert_equal 2, Game.in_date_range(Date.current, 1.day.from_now.to_date).size
      assert_equal ["game1", "game2"], Game.public_games.map{ |g| g.name }.sort
    end

    should "sort all games in chronological order" do
      assert_equal ["game1", "game2", "game3"], Game.chronological.map{ |g| g.name }
    end
  end

end
