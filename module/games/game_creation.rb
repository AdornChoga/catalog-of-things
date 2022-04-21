require_relative '../../classes/structure/game'
require_relative '../../classes/operations/author_operations'

module GameCreation
  def multiplayer_input
    puts ''
    puts 'Multiplayer game? [Y/N]:'
    print '=> '
    multiplayer = gets.chomp.downcase
    puts ''
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
    print '=> '
    archived = gets.chomp.downcase
    puts ''
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
    print '=> '
    last_played_at = gets.chomp
    puts ''
    puts 'Enter the date of plublishment (YYYY-MM-DD):'
    print '=> '
    publish_date = gets.chomp
    puts ''
    archived = archived_input
    [multiplayer, last_played_at, publish_date, archived]
  end

  def create_game
    multiplayer, last_played_at, publish_date, archived = game_inputs
    author = @authors.author_option_input
    new_game = Game.new(multiplayer, last_played_at, publish_date, archived)
    new_game.author = author
    [new_game, author]
  end
end
