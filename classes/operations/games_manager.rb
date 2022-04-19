require_relative '../structure/game'
require_relative '../../module/data_operations'

class GamesManager
  include DataOperations

  def game_inputs
    puts 'Multiplayer game? [Y/N]:'
    multiplayer = gets.chomp
    puts 'Enter the date it was last played (YYYY-MM-DD):'
    last_played_at = gets.chomp
    puts 'Enter the date of plublishment (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Is it archived? [Y/N]:'
    archived = gets.chomp
    [multiplayer, last_played_at, publish_date, archived]
  end

  def create_game
    multiplayer, last_played_at, publish_date, archived = game_inputs
    new_game = Game.new(multiplayer, last_played_at, publish_date, archived)
    update_data('games', new_game.to_hash)
  end
end
