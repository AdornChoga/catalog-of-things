require 'json'
require_relative 'data_operations'
require_relative '../classes/structure/book'


module BookCreation
  include DataOperations

  attr_accessor :book_store
  attr_reader :label_manager

  def initialize
    @book_store = fetch_data('book_store')
    @label_manager = label_manager
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
end