require_relative 'data_operations'
require_relative '../classes/structure/game'

module PopulateGames
  include DataOperations

  def populate_games
    store_games = fetch_data('games')
    store_games.map do |game|
      game_object = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['archived'])
      game_object.id = game['id']
      game_object
    end
  end
end
