module Contexts
  module Games

    def create_games
      @game1 = FactoryBot.create(:game, name: "game1", date: Date.current, time: Time.current, description: "a basketball game 1", private: false, longitude: 0.0, latitude: 0.0)
      @game2 = FactoryBot.create(:game, name: "game2", date: 1.day.from_now.to_date, time: Time.current, description: "a basketball game 2", private: false, longitude: 0.1, latitude: 0.0)
      @game3 = FactoryBot.create(:game, name: "game3", date: 2.days.from_now.to_date, time: Time.current, description: "a basketball game 3", private: true, longitude: 0.0, latitude: 0.1)
    end

    def destroy_games
      @game1.destroy
      @game2.destroy
      @game3.destroy
    end
  end
end