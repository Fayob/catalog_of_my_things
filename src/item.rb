class Item
  attr_accessor :publish_date, :archieved
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = rand(100...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    genre.item = self
  end

  def author=(author)
    author.item = self
  end

  def source=(source)
    source.item = self
  end

  def label=(label)
    label.item = self
  end
end
