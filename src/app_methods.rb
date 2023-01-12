require_relative './music_detail'
require_relative './genre'
require_relative './label'
require 'json'

module AppMethods
  @@genre_arr = JSON.parse(File.read('./src/database/genre.json'))
  @@music_album_arr = JSON.parse(File.read('./src/database/musicAlbum.json'))

  def list_music_albums
    if @@music_album_arr.empty?
      puts 'Oops! No available Album'
    else
      @@music_album_arr.each_with_index do |album, index|
        puts "[#{index + 1}] #{album['title']} by #{album['artist']}"
      end
    end
  end

  def list_genres
    if @@genre_arr.empty?
      puts 'Oops! No music found'
    else
      puts @@genre_arr.uniq
    end
  end

  def add_music_album
    print 'Enter Album name: '
    title = gets.chomp

    print 'Enter artist name: '
    artist = gets.chomp

    print 'Enter the publish date: '
    publish_date = gets.chomp

    print 'Enter genre: '
    genre = gets.chomp

    print 'Is it on_spotify? [Y/N] '
    spotify = gets.chomp.downcase
    on_spotify = it_true(spotify)

    Genre.new(genre)
    MusicDetail.new(title, artist, genre, on_spotify, publish_date)

    preserve_data(title, artist, genre, on_spotify, publish_date)

    puts 'Music Album Created Successfully'
  end

  def preserve_data(title, artist, genre, on_spotify, publish_date)
    @@genre_arr << genre

    @@music_album_arr << {
      'title' => title,
      'artist' => artist,
      'genre' => genre,
      'on_spotify' => on_spotify,
      'publish_date' => publish_date
    }

    File.write('./src/database/genre.json', JSON.pretty_generate(@@genre_arr))
    File.write('./src/database/musicAlbum.json', JSON.pretty_generate(@@music_album_arr))
  end

  private

  def it_true(bool)
    case bool
    when 'y'
      true
    when 'n'
      false
    end
  end
end
