require './src/arcade'
require './src/modules/preserve_arcade'
require_relative './music_methods'
require './src/game_author'

class App
  include PreserveArcade
  include MusicMethods

  def initialize
    @arcade = Arcade.new
    @game = GameAuthor.new
  end

  def list_options
    op = "
    Welcome to catalog of things
    Please choose your desired option below

    (1) List all books
    (2) List all music albums
    (3) List of games
    (4) List all genres
    (5) List all labels
    (6) List all authors
    (7) Add a book
    (8) Add a music album
    (9) Add a game
    (10) Quit"

    puts op
  end

  def way_to_exit
    preserve_arcade_data(@arcade)
    @game.save_authors
    @game.save_games
    puts 'Exiting...'
    exit
  end

  def first_choices(input)
    case input
    when 1
      @arcade.list_books(false)
    when 2
      list_music_albums
    when 3
      @game.list_games
    end
  end

  def second_choices(input)
    case input
    when 4
      list_genres
    when 5
      @arcade.list_labels(false)
    when 6
      @game.list_authors
    end
  end

  def third_choices(input)
    case input
    when 7
      @arcade.add_book
    when 8
      add_music_album
    when 9
      @game.add_game
    end
  end

  def choices
    list_options
    input = gets.chomp.to_i

    if input.positive? && input < 4
      first_choices(input)
    elsif input > 3 && input < 7
      second_choices(input)
    elsif input > 6 && input < 10
      third_choices(input)
    else
      way_to_exit
    end
  end
end
