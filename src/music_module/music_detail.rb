require_relative './music_album'

class MusicDetail < MusicAlbum
  @@musicAlbums = []
  attr_reader :title, :artist
  
  def initialize(title, artist, on_spotify, publish_date)
    super(publish_date, on_spotify)
    @title = title
    @artist = artist

    @@musicAlbums << self
  end

  def self.list_music_albums
    @@musicAlbums
  end

end