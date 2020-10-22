require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  # Test relationships
  should belong_to :favoriter
  should belong_to :favoritee

  # Test validations
  should validate_presence_of(:favoriter_id)
  should validate_presence_of(:favoritee_id)
  should validate_uniqueness_of(:favoriter_id).scoped_to(:favoritee_id)

  context "Given context" do
    setup do
      create_users
      create_favorites
    end

    teardown do
      destroy_favorites
      destroy_users
    end

    should "get all favorites for favoriter user1" do
      assert_equal 2, Favorite.for_favoriter(@user1.id).size
      assert_equal [3, 4], Favorite.for_favoriter(@user1.id).map{ |f| f.id }.sort
    end

    should "get all favorites for favoritee user1" do
      assert_equal 2, Favorite.for_favoritee(@user1.id).size
      assert_equal [1, 2], Favorite.for_favoritee(@user1.id).map{ |f| f.id }.sort
    end
  end
end
