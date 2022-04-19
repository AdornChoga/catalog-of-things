require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && on_spotify

    false
  end

  def to_hash
    {
      'publish_date' => @publish_date.to_s,
      'archived' => @archived,
      'on_spotify' => @on_spotify,
      'genre' => { 'name' => @genre.name, 'id' => @genre.id }
    }
  end

  private :can_be_archived?
end
