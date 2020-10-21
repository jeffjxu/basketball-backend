module Contexts
  module Favorites

    def create_favorites
      @favorite1 = FactoryBot.create(:favorite, favoriter: @user2, favoritee: @user1)
      @favorite2 = FactoryBot.create(:favorite, favoriter: @user3, favoritee: @user1)
      @favorite3 = FactoryBot.create(:favorite, favoriter: @user1, favoritee: @user3)
    end

    def destroy_favorites
      @favorite1.destroy
      @favorite2.destroy
      @favorite3.destroy
    end
  end
end