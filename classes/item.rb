require 'date'

class Item
  attr_reader :id, :archived, :genre
  attr_accessor :publish_date, :label

  def initialize(publish_date, archived)
    @id = rand(1..100)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @genre = nil
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    date_published = publish_date.year
    date_now = Date.today.year
    num_of_years = date_now - date_published
    return true unless num_of_years < 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private :can_be_archived?
end
