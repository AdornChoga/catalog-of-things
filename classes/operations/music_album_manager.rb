require_relative '../structure/music_album'
require_relative '../../module/data_operations'
require_relative '../../module/music_sub_menu'

class MusicAlbumManager
  include DataOperations
  include MusicSubMenu

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
    on_spotify = gets.chomp.to_s.downcase != 'y'

    puts 'Is it archived? (y/n)'
    archived = gets.chomp.to_s.downcase != 'y'

    album = MusicAlbum.new(publish_date, archived, on_spotify)

    genre_object = add_album_to_genre

    album.genre = genre_object[0]

    hashed_album = album.to_hash

    @music_albums << hashed_album

    @genre_manager.update_genre_file(genre_object[1], hashed_album)

    update_data('music_albums', hashed_album)

    puts 'Successfully added a music album to your catlog 😀'
    puts '__________________________________________________'
  end

  def add_album_to_genre
    puts 'Choose the genre for your album'
    @genre_manager.list_genres
    genre_index = gets.chomp.to_i

    if genre_index == @genre_manager.genre_data.length
      return [@genre_manager.create_genre,
              @genre_manager.genre_data.length - 1]
    end

    hashed_genre = @genre_manager.genre_data[genre_index]
    [@genre_manager.format_genre(hashed_genre), genre_index]
  end

  def list_albums
    puts 'Here are all the music albums in your catlog:'
    @music_albums.each do |album|
      puts "Published Date - #{album['publish_date']}
            Archived - #{album['archived']}
            On Spotify - #{album['on_spotify']}
            Genre - #{album['genre_name']}"
      puts '__________________________________________________'
    end
  end
end
