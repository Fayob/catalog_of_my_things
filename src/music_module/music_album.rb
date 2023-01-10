require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    if @archived && @on_spotify
      true
    else
      false
    end
  end
end
