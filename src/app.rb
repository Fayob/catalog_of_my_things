require './src/riz/arcade'
require './src/riz/modules/preserve_arcade'

class App
  include PreserveArcade

  def initialize
    @arcade = Arcade.new
  end

  def list_options
    op = "
    (1) List all books
    (2) List all music albums
    (3) List of games
    (4) List all genres
    (5) List all labels
    (6) List all authors
    (7) List all sources
    (8) Add a book
    (9) Add a music album
    (10) Add a game
    (11) Quit"

    puts op
  end

  def way_to_exit
    preserve_arcade_data(@arcade)
    puts 'Exiting...'
    exit
  end

  def first_choices(input)
    case input
    when 1
      @arcade.list_books(false)
    when 2
      puts 'list_music_albums'
    when 3
      puts 'list_games'
    end
  end

  def second_choices(input)
    case input
    when 4
      puts 'list_genres'
    when 5
      @arcade.list_labels(false)
    when 6
      puts 'list_authors'
    when 7
      puts 'list_sources'
    end
  end

  def third_choices(input)
    case input
    when 8
      @arcade.add_book
    when 9
      puts 'add_music_album'
    when 10
      puts 'add_game'
    end
  end

  def choices
    list_options
    input = gets.chomp.to_i

    if input.positive? && input < 4
      first_choices(input)
    elsif input > 3 && input < 8
      second_choices(input)
    elsif input > 7 && input < 11
      third_choices(input)
    else
      way_to_exit
    end
  end
end
