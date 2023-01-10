require './src/modules/item'
require './src/modules/label'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, label, genre, author, book_data)
    super(publish_date, label, genre, author)
    @publisher = book_data[:publisher]
    @cover_state = book_data[:cover_state]
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
