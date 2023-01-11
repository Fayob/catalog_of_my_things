require_relative '../game'
require_relative '../author'
require_relative '../app'
require 'json'

class GameAuthor
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
    @app = App.new
  end

  def add_game
    is_multiplayer = true

    puts 'Add a new game'
    puts ''

    print 'Last played on? [yyyy-mm-dd]: '
    date = gets.chomp
    last_played = validate_date(date)

    print 'Pushlished on? [yyyy-mm-dd]: '
    date2 = gets.chomp
    publish_date = validate_date(date2)

    print 'Is the game a Multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase

    case multiplayer
    when 'y' then is_multiplayer
    when 'n' then is_multiplayer = false
    else
      puts 'Invalid option. Game not added.'
      @app.choices
    end

    new_game = Game.new(is_multiplayer, last_played, publish_date)
    @games << new_game
    puts 'Game added successfully'
    @app.choices
  end

  # Validate user dates
  def validate_date(date)
    format = '%Y-%m-%d'
    DateTime.strptime(date, format)
    date
  rescue ArgumentError
    puts 'Invalid date. Required format [YYYY-MM-DD]'
    print 'Try again: '
    date = gets.chomp
    validate_date(date)
  end

  # List games
  def list_games
    if @games.empty?
      puts 'No games available!'
    else
      puts 'List of available games.'
      puts ''
      @games.each do |game|
        puts "#{[game.class]} Multiplayer: #{game.multiplayer} Last Played:
        #{game.last_played_at} Pushlish Date: #{game.publish_date}"
      end
    end
    @app.choices
  end

  # List authors
  def list_authors
    if @authors.empty?
      puts 'No authors available!'
    else
      puts 'List of authors'
      puts ''
      @authors.each do |author|
        puts "#{author.first_name} #{author.last_name}"
      end
    end
    @app.choices
  end
end
