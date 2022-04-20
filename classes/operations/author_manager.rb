require_relative '../structure/author'
require_relative '../../module/data_operations'
require_relative '../../module/populate_games'
require_relative '../../module/populate_authors'

class AuthorManager
  include DataOperations
  include PopulateAuthors

  attr_accessor :authors

  def initialize
    @authors = populate_authors
  end

  def create_author
    puts 'Enter the first name of the author:'
    first_name = gets.chomp
    puts 'Enter the last name of the author:'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @authors << new_author
    update_data('authors', new_author.to_hash)
    new_author
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "(#{index}) #{author.id} - #{author.first_name} - #{author.last_name}"
    end
  end

  def authors_options
    puts 'Enter author of game by a chosing a number from below:'
    list_authors
    puts "(#{@authors.length}) - Create a new author"
    gets.chomp.to_i
  end

  def author_option_input
    option = authors_options
    return create_author if option == @authors.size

    @authors[option]
  end
end
