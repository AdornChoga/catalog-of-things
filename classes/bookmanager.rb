require './book'
require 'json'

class Bookmanager
  def to_get_publisher
    state = false
    until state
      puts 'Please type in the name of the publisher:'
      get_input = gets.chomp
      state = true unless get_input == ''
    end
    get_input
  end

  def to_get_cover_state
    cover_state = ''
    state = false
    until state
      puts 'Please type in good or bad for the cover_state:'
      cover_state = gets.chomp
      state = %w[good bad].include?(cover_state)
      cover_state = '' unless state
      puts 'Please insert good or bad as the cover state' unless valid
    end
    cover_state
  end

  def create_new_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @book_store << book
  end

  def add_new_book
    publisher = to_get_publisher('publisher')
    cover_state = to_get_cover_state
    publish_date = to_get_publish_date.to_s
    create_new_book(publisher, cover_state, publish_date)
  end
end
