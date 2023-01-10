class Item
  attr_reader :id, :publish_date, :archived, :genre

  def initialize(publish_date, archived)
    @id = rand(100...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
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

  def can_be_archived?
    @now = Date.today
    @date = Date.parse(@publish_date)
    ((@now - @date) / 365).floor > 10
  end

  def moved_to_archive
    @archived = true if can_be_archived?
  end
end
