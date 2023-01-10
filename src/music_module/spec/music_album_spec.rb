require_relative '../music_album'

describe MusicAlbum do
  it('should test for on_spotify instance varaible') do
    music_album = MusicAlbum.new('10-01-2023', true)
    expect(music_album.on_spotify).to eql(true)
  end

  it('should test for publish date instance varaible') do
    music_album = MusicAlbum.new('10-01-2023', true)
    expect(music_album.publish_date).to eql('10-01-2023')
  end
  it('should test for archived instance varaible') do
    music_album = MusicAlbum.new('10-01-2023', true)
    expect(music_album.archived).to eql(false)
  end
end
