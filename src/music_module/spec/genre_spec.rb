require_relative '../genre'

describe Genre do
  it('should test for instance variable') do
    genre = Genre.new('John')
    expect(genre.name).to eql('John')
  end

  it('should return an array') do
    genre = Genre.new('James')
    expect(genre.items).to be_a Array
  end
end
