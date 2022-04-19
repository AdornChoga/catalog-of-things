require_relative '../structure/author'
require_relative '../../module/data_operations'

class AuthorManager
  include DataOperations

  attr_accessor :author_data

  def initialize
    @author_data = fetch_data('author')
  end

  def create_author
    puts 'Enter the first name of the author:'
    first_name = gets.chomp
    puts 'Enter the last name of the author:'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @author_data << new_author.to_hash
    update_data('author', new_author.to_hash)
    new_author
  end

  def list_authors
    @author_data.each_with_index do |author, index|
      puts "(#{index}) #{author['id']} - #{author['first-name']} - #{author['last-name']}"
    end

    puts "(#{@author_data.length}) - Create a new author"
  end

  def format_author(hashed_author)
    author = Author.new(hashed_author['first_name'], hashed_author['last_name'])
    author.id = hashed_author['id']
    author
  end
end
