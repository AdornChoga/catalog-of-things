class Author
  attr_reader :items
  attr_accessor :first_name, :last_name, :id

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

  def to_hash
    hashed_items = @items.map do |item|
      item.to_hash.select! { |k, _| %w[id item_type].include?(k) }
    end
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => hashed_items
    }
  end
end
