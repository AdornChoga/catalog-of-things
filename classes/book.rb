require './item'

class Book < Item
  attr_accessor :pubisher, :cover_date

  def initialize(pubisher, cover_state, publish_date)
    super(publish_date)
    @id = rand(1..50)
    @pubisher = pubisher
    @cover_state = cover_state.to_s
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
