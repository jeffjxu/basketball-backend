require './test/sets/users'
require './test/sets/games'
require './test/sets/players'
require './test/sets/favorites'

module Contexts
  include Contexts::Users
  include Contexts::Games
  include Contexts::Players
  include Contexts::Favorites

  def create_all
    create_users
    puts "users created"
    create_games
    puts "games created"
    create_players
    puts "players created"
    create_favorites
    puts "favorties created"
  end

  def destroy_all
    destroy_favorites
    puts "favorites destroyed"
    destroy_players
    puts "players destroyed"
    destroy_games
    puts "games destroyed"
    destroy_users
    puts "users destroyed"
  end
  
end