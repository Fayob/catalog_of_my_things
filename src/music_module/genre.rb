class Genre
  @@genres = []
  attr_reader :name, :items

  def initialize(name)
    @id = rand(100...1000)
    @name = name
    @items = []

    @@genres << self
  end

  def self.all_genres
    @@genres
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
