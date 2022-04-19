require_relative 'bookmanager'
require_relative 'genre_manager'
require_relative 'music_album_manager'

class App
  attr_accessor :genre, :music_album, :book_manager

  def initialize
    @genre = GenreManager.new
    @music_album = MusicAlbumManager.new(@genre)
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
      # books_operations
    when 2
      puts 'Games operations'
    when 3
      @music_album.display_options
    when 4
      specifications
    end
  end

  def specifications
    puts '
    1 - List all genres
    2 - List all labels
    3 - List all authors
    4 - to return to the main menu'

    get_option = gets.chomp.to_i
    case get_option
    when 1
      @genre.list_genres(type: false)
    when 2
      puts 'list all labels'
    when 3
      puts 'list all authors'
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
