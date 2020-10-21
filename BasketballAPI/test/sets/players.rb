module Contexts
  module Players

    def create_players
      @player1 = FactoryBot.create(:player, status: "going", user: @user1, game: @game1)
      @player2 = FactoryBot.create(:player, status: "maybe", user: @user2, game: @game1)
      @player3 = FactoryBot.create(:player, status: "invited", user: @user3, game: @game1)
    end

    def destroy_players
      @player1.destroy
      @player2.destroy
      @player3.destroy
    end
  end
end