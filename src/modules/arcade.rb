require './src/modules/book'
require './src/modules/label'

class Arcade
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book(publish_date, publisher, cover_state)
    @books << Book.new(publish_date, publisher, cover_state)
  end

  def add_label(title, color)
    @labels << Label.new(title, color)
  end

  def add_book_label(label, book)
    book.modify_label(label)
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.publisher}, Publisher: #{book.publish_date}, Cover State: #{book.cover_state}"
    end
  end

  def list_labels
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end
end
