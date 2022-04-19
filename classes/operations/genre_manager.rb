require_relative '../structure/genre'
require_relative '../../module/data_operations'

class GenreManager
  include DataOperations

  attr_accessor :genre_data

  def initialize
    @genre_data = fetch_data('genre')
  end

  def create_genre
    puts 'Enter the name of the genre:'
    name = gets.chomp
    new_genre = Genre.new(name)
    @genre_data << new_genre.to_hash
    update_data('genre', new_genre.to_hash)
    new_genre
  end

  def list_genres(type: false)
    @genre_data.each_with_index do |genre, index|
      puts "(#{index}) ID: #{genre['id']} - Genre Name: #{genre['name']}"
    end

    puts "(#{@genre_data.length}) - Create a new genre" unless type
  end

  def format_genre(hashed_genre)
    genre = Genre.new(hashed_genre['name'])
    genre.id = hashed_genre['id']
    genre
  end

  def update_genre_file(index, album)
    @genre_data = fetch_data('genre')
    album_hash = album.to_hash.reject! { |k, _| k == 'genre' }
    album_hash['genre_name'] = @genre_data[index]['name']
    @genre_data[index]['items'] << album_hash
    rewrite_data('genre', @genre_data)
  end
end
