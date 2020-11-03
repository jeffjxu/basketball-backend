require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password

  # Test relationships
  should have_many(:players)

  # Test validations
  # Required field validations
  should validate_presence_of(:email)
  should validate_presence_of(:firstname)
  should validate_presence_of(:lastname)
  should validate_presence_of(:dob)
  should validate_presence_of(:phone)

  # Username validations
  should validate_uniqueness_of(:username).case_insensitive

  # Date validations
  should allow_value(1.day.ago.to_date).for(:dob)
  should_not allow_value(Date.current).for(:dob)
  should_not allow_value(1.day.from_now.to_date).for(:dob)
  should_not allow_value("date").for(:dob)

  # Phone validation
  should allow_value("1234567890").for(:phone)
  should allow_value("123-456-7890").for(:phone)
  should_not allow_value("hello").for(:phone)
  should_not allow_value("123456789").for(:phone)

  # Email validation
  should allow_value("michaeljordan@gmail.com").for(:email)
  should_not allow_value("email").for(:email)
  should_not allow_value(123).for(:email)

  context "Given context" do
    setup do
      create_users
    end

    teardown do
      destroy_users
    end

    should "sort all users alphabetically by username" do
      assert_equal ["kobebryant", "lebronjames", "michaeljordan"], User.alphabetical_username.map{ |u| u.username }.sort
    end

    should "sort all users alphabetically by lastname, firstname" do
      assert_equal ["kobebryant", "lebronjames", "michaeljordan"], User.alphabetical_username.map{ |u| u.username }.sort
    end

    should "get all games associated with a user" do
      create_games
      create_players

      assert_equal [@game1, @game2, @game3], @user1.games

      destroy_players
      destroy_games
    end

    should "search for player by firstname, lastname, or username" do
      assert_equal ["kobebryant"], User.search("kobe").map{ |u| u.username }
      assert_equal ["lebronjames", "michaeljordan"], User.search("j").map{ |u| u.username }.sort
    end
  end
end
