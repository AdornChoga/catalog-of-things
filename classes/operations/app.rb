require_relative 'book_manager'
require_relative 'genre_manager'
require_relative 'music_album_manager'
require_relative 'label_manager'

class App
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
    3 - Movies
    4 - Music
    5 - See specifications
    6 - Exit'
  end

  def operations(option)
    case option
    when 1
      @book_manager.books_operations
    when 2
      puts 'Games operations'
    when 3
      puts 'Movies operations'
    when 4
      @music_album.menu_list
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
