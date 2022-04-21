require_relative 'book_manager'
require_relative 'genre_manager'
require_relative 'music_album_manager'
require_relative 'label_manager'
require_relative 'games_operations'
require_relative '../../module/games/games_menu'

class App
  include GamesMenu
  attr_accessor :genre, :music_album, :book_manager, :label

  def initialize
    @genre = GenreManager.new
    @label = LabelManager.new
    @music_album = MusicAlbumManager.new(@genre)
    @book_manager = Bookmanager.new(@label)
  end

  def list_of_options
    puts '
    1 - Books
    2 - Games
    3 - Music
    4 - See specifications
    5 - Exit'
  end

  def operations(option)
    case option
    when 1
      @book_manager.books_operations
    when 2
      games_menu
    when 3
      @music_album.display_options
    when 4
      specifications
    end
  end

  def spec_options
    puts '
    1 - List all genres
    2 - List all labels
    3 - List all authors
    4 - to return to the main menu'
  end

  def specifications
    puts 'What would you like to see: '

    until spec_options
      get_option = gets.chomp.to_i
      case get_option
      when 1
        @genre.list_genres(type: true)
      when 2
        @label.list_labels
      when 3
        puts '_______Authors_______'
        AuthorOperations.new.list_authors
      end
      if get_option == 4
        puts 'Returning to the main menu:'
        break
      end
    end
  end

  def display_options
    puts 'What would you like to do today?'
    until list_of_options
      get_input = gets.chomp.to_i
      operations(get_input)
      break if get_input == 5
    end
    puts 'Thank you for using this app!'
  end
end
