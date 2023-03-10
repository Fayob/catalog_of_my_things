require 'json'
require './src/arcade'
require './src/book'
require './src/label'

module PreserveArcade
  BOOKS_FILE = './src/database/books.json'.freeze
  LABELS_FILE = './src/database/labels.json'.freeze

  def preserve_labels(labels)
    data = []
    labels.each do |label|
      data << {
        title: label.title,
        color: label.color
      }
    end
    File.write(LABELS_FILE, JSON.generate(data))
  end

  def preserve_books(arcade_data)
    preserve_labels(arcade_data.labels)

    data = []

    arcade_data.books.each do |book|
      data << {
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state,
        archived: book.archived,
        label_i: arcade_data.labels.index(book.label)
      }
    end

    File.write(BOOKS_FILE, JSON.generate(data))
  end

  def create_book_class(data, labels)
    return [] if data.empty?

    new_data = []

    data.each do |book|
      new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
      book['archived'] && new_book.move_to_archive
      new_book.modify_label(labels[book['label_i']])
      new_data << new_book
    end

    new_data
  end

  def create_label_class(data)
    return [] if data.empty?

    new_data = []

    data.each do |label|
      new_data << Label.new(label['title'], label['color'])
    end

    new_data
  end

  private :preserve_books, :preserve_labels, :create_book_class, :create_label_class

  def preserve_arcade_data(arcade_data)
    preserve_books(arcade_data)
  end

  def fetch_books(labels)
    File.new(BOOKS_FILE.to_s, 'w') unless File.exist?(BOOKS_FILE)
    file = File.read(BOOKS_FILE)
    data = file.empty? ? [] : JSON.parse(file)
    create_book_class(data, labels)
  end

  def fetch_labels
    File.new(LABELS_FILE.to_s, 'w') unless File.exist?(LABELS_FILE)
    file = File.read(LABELS_FILE)
    data = file.empty? ? [] : JSON.parse(file)
    create_label_class(data)
  end
end
