require_relative 'item'

class Author < Item
  attr_accessor :first_name, :last_name
  def initialize(first_name, last_name, publish_date, archived)
    super(publish_date, archived)
    @id = Math.rand(1...100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end