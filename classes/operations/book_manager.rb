require 'json'
require_relative '../structure/book'
require_relative '../../module/data_operations'

class Bookmanager
  include DataOperations
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

  def create_new_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)

    # create labelobj
    label_object = add_book_to_label

    # append book label to label ojb
    book.label = label_object[0]

    @book_store << book.to_hash
    @label_manager.update_label_file(label_object[1], book.to_hash)
    update_data('book_store', book.to_hash)
    puts
    puts 'The book was added with success'
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

  def add_book_to_label
    puts 'Select a label for your book'
    @label_manager.list_labels
    label_index = gets.chomp.to_i

    if label_index == @label_manager.label_data.length
      return [@label_manager.create_label,
              @label_manager.label_data.length - 1]
    end

    hashed_label = @label_manager.label_data[label_index]
    [@label_manager.format_label(hashed_label), label_index]
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