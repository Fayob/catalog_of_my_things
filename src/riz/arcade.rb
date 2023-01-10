require './src/riz/book'
require './src/riz/label'
require './src/riz/modules/preserve_arcade'

class Arcade
  include PreserveArcade
  attr_accessor :books, :labels

  def initialize
    @books = fetch_books
    @labels = fetch_labels
  end

  def add_book
    puts 'Enter publish Publish Date:'
    publish_date = gets.chomp.to_s

    puts 'Enter Publisher:'
    publisher = gets.chomp

    puts "Enter Cover State:\n(1)Great\n(2)Good\n(3)bad"
    cover_state = gets.chomp.to_i
    cover_state_options = { 1 => 'Great', 2 => 'Good', 3 => 'Bad' }

    @books << Book.new(publish_date, publisher, cover_state_options[cover_state] || 'bad')

    puts 'The book has been added successfully!'
  end

  def add_label
    puts 'Entre Title:'
    title = gets.chomp

    puts 'Entre Color'
    color = gets.chomp

    @labels << Label.new(title, color)
  end

  def add_book_label(_label, _book)
    if @books.legnth && @labels.legnth
      puts 'Please Select a Book:'
      list_books(true)
      book_i = gets.chomp.to_i

      puts 'Please select a Label:'
      list_labels(true)
      label_i = gets.chomp.to_i

      @books[book_i].modify_label(@labels[label_i])

      puts 'Label was added to the Book successfully!'
    else
      puts 'Please make sure you have at least one book or one label added!'
    end
  end

  def list_books(with_index)
    @books.each_with_index do |book, i|
      indexing = with_index ? "#{i + 1})" : ''
      puts "#{indexing} Title: #{book.publisher}, Publisher: #{book.publish_date}, Cover State: #{book.cover_state}"
    end
  end

  def list_labels(with_index)
    @labels.each_with_index do |label, i|
      indexing = with_index ? "#{i + 1})" : ''
      puts "#{indexing} Title: #{label.title}, Color: #{label.color}"
    end
  end
end
