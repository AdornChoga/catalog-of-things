require_relative 'data_operations'
require_relative '../classes/structure/author'

module PopulateAuthors
  include DataOperations

  def populate_authors
    stored_authors = fetch_data('authors')
    stored_authors.map do |author|
      author_object = Author.new(author['first_name'], author['last_name'])
      author_object.id = author['id']
      author_object
    end
  end
end
