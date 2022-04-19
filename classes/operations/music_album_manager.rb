require_relative '../structure/music_album'
require_relative '../../module/data_operations'

class MusicAlbumManager
  include DataOperations
  attr_accessor :music_albums
  attr_reader :genre_manager

  def initialize(genre_manager)
    @music_albums = fetch_data('music_albums')
    @genre_manager = genre_manager
  end

  def add_album
    puts 'Enter the date it was published in (YYYY-MM-DD):'
    publish_date = gets.chomp

    puts 'Is it on Spotify? (y/n)'
    on_spotify = true if gets.chomp.to_s.downcase == 'y'

    puts 'Is it archived? (y/n)'
    archived = true if gets.chomp.to_s.downcase == 'y'

    album = MusicAlbum.new(publish_date, archived, on_spotify)

    genre_object = add_album_to_genre
     
    album.genre = genre_object

    @music_albums << album.to_hash

    update_data('music_albums', album.to_hash)

    puts 'Successfully added a music album to your catlog 😀'
    puts '__________________________________________________'
  end

  def add_album_to_genre
    puts 'Choose the genre for your album'
    @genre_manager.list_genres
    genre_index = gets.chomp.to_i
    
    if genre_index == @genre_manager.genre_data.length
        return @genre_manager.create_genre
    end

    hashed_genre = @genre_manager.genre_data[genre_index]
    return @genre_manager.format_genre(hashed_genre)
  end

  def list_albums
    puts 'all albums have been listed'
  end

  def manage_music(option)
    case option
    when 1
      add_album
    when 2
      list_albums
    end
  end

  def menu_list
    puts 'Nice choice! What would you like to do?'
    puts '
    1 - Add a music album
    2 - List all music albums'
    manage_music(gets.chomp.to_i)
  end
end
