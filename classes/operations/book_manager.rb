require 'json'
require_relative '../structure/book'
require_relative '../../module/data_operations'
require_relative '../../module/book_creation'

class Bookmanager
  include DataOperations
  include BookCreation
  attr_accessor :book_store
  attr_reader :label_manager

  def initialize(label_manager)
    @book_store = fetch_data('book_store')
    @label_manager = label_manager
  end

  def books_operations
    until list_of_options
      input = gets.chomp.to_i
      if input == 3
        puts 'book menu exited!'
        break
      end
      option(input)
    end
  end

  def list_of_options
    puts 'Enter a number to choose a type '
    puts '
      1 - add_new_book
      2 - list_all_books
      3 - Back to main menu'
  end

  def option(choice)
    case choice
    when 1
      add_new_book
    when 2
      list_all_books(@book_store)
    else
      puts 'Invalid input. Please enter a correct number'
    end
  end

  def add_new_book
    state = false
    until state
      puts 'Please enter the name of the publisher:'
      publisher = gets.chomp.to_s
      state = true unless publisher == ''
      puts 'Publisher name required' unless state == true
      publisher
    end

    puts 'Please type in good or bad for the cover_state:'
    cover_state = gets.chomp.to_s

    print 'Insert the date [YY-MM-DD]:'
    publish_date = gets.chomp.to_s
    create_new_book(publisher, cover_state, publish_date)
  end

  def list_all_books(books)
    puts 'Database empty, please add a book!' unless books.length.positive?
    books.each do |book|
      puts '---------------------------------------------'
      puts "#{books.find_index(book) + 1})"
      puts "ID: #{book['id']}"
      puts "Published: #{book['publish_date']}"
      puts "Publisher: #{book['publisher']}"
      puts "Label: Title - #{book['label']['title']} | Color - #{book['label']['color']}"
      puts '----------------------------------------------'
    end
  end
end
