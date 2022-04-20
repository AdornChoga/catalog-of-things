require_relative 'item'

class Label
  attr_reader :title, :color, :items, :id

  def initialize(title, color)
    @id = rand(0..50)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_hash
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }
  end
end
