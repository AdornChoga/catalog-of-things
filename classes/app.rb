require './classes/bookmanager'

class App

  def list_of_options
    puts '
    1 - Books
    2 - Games
    3 - Movies
    4 - Music
    5 - See specifications
    6 - Exit'
  end

  def operations(option)
    case option
    when 1
      # books_operations
    when 2
      puts 'Games operations'
    when 3
      puts 'Movies operations'
    when 4
      puts 'Music operations'
    when 5
      puts 'Spec operations'
    end
  end

  def display_options
    puts 'What would you like to do today?'
    until list_of_options
      get_input = gets.chomp.to_i
      operations(get_input)
      break if get_input == 6
    end
    puts 'Thank you for using this app!'
  end
end
