class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = rand(100...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end

  def remove_item(item)
    @items.delete(item)
  end
end
