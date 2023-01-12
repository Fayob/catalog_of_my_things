require './src/book'
require './src/label'
require './src/modules/preserve_arcade'

class Arcade
  include PreserveArcade
  attr_accessor :books, :labels

  def initialize
    @labels = fetch_labels
    @books = fetch_books(@labels)
  end

  def add_label
    print 'Entre Title: '
    title = gets.chomp

    print 'Entre Color: '
    color = gets.chomp

    Label.new(title, color)
  end

  private :add_label

  def add_book
    print 'Enter Publish Date [YYYY-MM-DD]: '
    publish_date = gets.chomp.to_s

    print 'Enter Publisher: '
    publisher = gets.chomp

    puts "Enter Cover State:\n(1)Great\n(2)Good\n(3)bad"
    cover_state = gets.chomp.to_i
    cover_state_options = { 1 => 'Great', 2 => 'Good', 3 => 'Bad' }

    new_book = Book.new(publish_date, publisher, cover_state_options[cover_state] || 'bad')
    new_label = add_label

    new_book.modify_label(new_label)

    @books << new_book
    @labels << new_label

    puts 'The book has been added successfully!'
  end

  def add_book_label(_label, _book)
    if @books.legnth && @labels.legnth
      print 'Please Select a Book: '
      list_books(true)
      book_i = gets.chomp.to_i

      print 'Please select a Label: '
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
      book_data = "Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Cover State: #{book.cover_state}"
      label_data = "Title: #{book.label.title}, Color: #{book.label.color}"
      puts "#{indexing} #{label_data}, #{book_data}"
    end
  end

  def list_labels(with_index)
    @labels.each_with_index do |label, i|
      indexing = with_index ? "#{i + 1})" : ''
      puts "#{indexing} Title: #{label.title}, Color: #{label.color}"
    end
  end
end
