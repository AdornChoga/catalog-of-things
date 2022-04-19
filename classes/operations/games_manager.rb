require_relative '../structure/game'
require_relative '../../module/data_operations'
require_relative '../../module/populate_games'

class GamesManager
  include DataOperations
  include PopulateGames

  def initialize
    @games = populate_games
  end

  def menu_options
    puts 'What would you like to do?'
    puts '
    1 - Add a new game
    2 - List all games
    3 - List all authors
    4 - Return to app menu
    '
    gets.chomp.to_i
  end

  def games_menu
    option = menu_options
    case option
    when 1
      add_game
    when 2
      listg_all_games
    when 3
      puts 'List of authors...'
    when 4
      nil
    else
      menu_actions
    end
  end

  def multiplayer_input
    puts 'Multiplayer game? [Y/N]:'
    multiplayer = gets.chomp.downcase
    case multiplayer
    when 'y', 'yes'
      multiplayer = true
    when 'n', 'no'
      multiplayer = false
    else
      puts 'Invalid input!'
      multiplayer_input
    end
    multiplayer
  end

  def archived_input
    puts 'Is it archived? [Y/N]:'
    archived = gets.chomp.downcase
    case archived
    when 'y', 'yes'
      archived = true
    when 'n', 'no'
      archived = false
    else
      puts 'Invalid input!'
      archived_input
    end
    archived
  end

  def game_inputs
    multiplayer = multiplayer_input
    puts 'Enter the date it was last played (YYYY-MM-DD):'
    last_played_at = gets.chomp
    puts 'Enter the date of plublishment (YYYY-MM-DD):'
    publish_date = gets.chomp
    archived = archived_input
    [multiplayer, last_played_at, publish_date, archived]
  end

  def add_game
    multiplayer, last_played_at, publish_date, archived = game_inputs
    new_game = Game.new(multiplayer, last_played_at, publish_date, archived)
    update_data('games', new_game.to_hash)
    @games << new_game
    puts 'Game created successfully!'
    games_menu
  end

  def listg_all_games
    @games.map(&:to_hash).each_with_index do |game, index|
      puts "(#{index}) - id: #{game['id']} - last_played_at: #{game['last_played_at']}"
    end
    games_menu
  end
end
