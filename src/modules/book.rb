require './src/modules/item'
require './src/modules/label'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, label, genre, author, publisher, cover_state)
    super(publish_date, label, genre, author)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end




