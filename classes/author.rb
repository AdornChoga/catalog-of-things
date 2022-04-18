require_relative 'item'

class Author < Item
  attr_accessor :first_name, :last_name
  def initialize(first_name, last_name, publish_date, archived)
    super(publish_date, archived)
    @first_name = first_name
    @last_name = last_name
  end
end