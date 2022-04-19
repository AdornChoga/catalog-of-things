class Author
  attr_reader :items, :id
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1...100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
