require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :pubisher, :cover_state

  def initialize(pubisher, cover_state, publish_date)
    super(publish_date, true)
    @id = rand(1..50)
    @pubisher = pubisher
    @cover_state = cover_state.to_s
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_hash
    {
      'id' => @id,
      'publish_date' => @publish_date.to_s,
      'publisher' => @pubisher,
      'cover_state' => @cover_state,
      'label' => { 'title' => @label.title, 'color' => @label.color, 'id' => @label.id }
    }
  end
end
