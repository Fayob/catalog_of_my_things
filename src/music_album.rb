require_relative 'item'

class MusicAlbum < Item
  attr_reader :name

  def initialize(name, publish_date, archived, on_spotify)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?
    if @archived && @on_spotify
      true
    else
      false
    end
  end
end
