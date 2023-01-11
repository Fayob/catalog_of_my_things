require_relative './music_detail.rb'
require_relative './genre.rb'
require_relative '../modules/label.rb'
require 'json'

module AppMethods
  @@genreArr = JSON.parse(File.read('./src/music_module/storage/genre.json'))
  @@musicAlbumArr = JSON.parse(File.read('./src/music_module/storage/musicAlbum.json'))

  def list_music_albums
    if @@musicAlbumArr.empty?
      puts 'Oops! No available Album'
    else
      @@musicAlbumArr.each_with_index do |album, index| 
        puts "[#{index + 1}] #{album["title"]} by #{album["artist"]}"
      end
    end
  end

  def list_genres
    if @@genreArr.empty?
      puts 'Oops! No music found'
    else
      puts @@genreArr.uniq
    end
  end

  def is_it_true(bool)
    case bool
    when 'y'
      true
    when 'n'
      false
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
    on_spotify = is_it_true(spotify)

    Genre.new(genre)
    MusicDetail.new(title, artist, genre, on_spotify, publish_date) 

    preserve_data(title, artist, genre, on_spotify, publish_date)
    
    puts 'Music Album Created Successfully'
  end

  def preserve_data(title, artist, genre, on_spotify, publish_date)
    @@genreArr << genre

    @@musicAlbumArr << {
          'title' => title, 
          'artist' => artist, 
          'genre' => genre, 
          'on_spotify' => on_spotify, 
          'publish_date' => publish_date
        }

    File.write('./src/music_module/storage/genre.json', JSON.pretty_generate(@@genreArr))
    File.write('./src/music_module/storage/musicAlbum.json', JSON.pretty_generate(@@musicAlbumArr))
  end
end
