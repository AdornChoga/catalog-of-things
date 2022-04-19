require 'json'
require './classes/book'

module Bookmanager
  def books_operations
    puts 'Enter a number to choose a type '
    puts '
    1 - create_new_book
    2 - add_new_book
    3 - liat_all_book
    6 - Exit'

    option = gets.chomp.to_i
    case option
    when 1
      create_new_book
    when 2
      add_new_book
    when 3
      liat_all_book
    else
      puts 'Invalid input. Please enter a correct number'
    end
  end

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

  def liat_all_book
    # in progess
  end
end
