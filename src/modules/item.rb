require 'date'
require './src/item'

class ItemReplication < Item
  attr_accessor :publish_date, :archived, :label, :genre, :author
  attr_reader :id

  def initialize(publish_date, label, genre, author)
    super(publish_date)
    @label = label
    @genre = genre
    @author = author
    label.items << self
  end

  def modify_label(label)
    @label.remove_item(self)
    label.add_item(self)
  end
end
