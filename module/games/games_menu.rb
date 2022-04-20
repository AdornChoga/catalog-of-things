require_relative '../../classes/operations/games_operations'

module GamesMenu
  def menu_options
    puts 'Games Menu [Pick a number below]'
    puts '
    1 - Add a new game
    2 - List all games
    3 - Return to main menu
    '
    print 'Option: '
    gets.chomp.to_i
  end

  def games_menu
    puts ''
    option = menu_options
    case option
    when 1
      GamesOperations.new.add_game
    when 2
      GamesOperations.new.list_all_games
    when 3
      return
    else
      puts 'Invalid option'
      games_menu
    end
    games_menu
  end
end
