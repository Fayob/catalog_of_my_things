require './src/modules/book'

label1 = Label.new('test label', 'red')
book1 = Book.new('20201201', label1, 'genre', 'author', { publisher: 'test publisher', cover_state: 'good' })
book2 = Book.new('20201201', label1, 'genre', 'author', { publisher: 'test publisher', cover_state: 'bad' })

describe Book do
  context 'When testing the Book class can_be_archived? method' do
    it 'initiating the class should set archived attr to false' do
      expect(book1.archived).to be false
    end

    it 'calling can_be_archived? should override parent method and return true if cover_status is "good"' do
      expect(book1.can_be_archived?).to be false
    end

    it 'calling can_be_archived? should override parent method and return true if cover_status is "good"' do
      expect(book2.can_be_archived?).to be true
    end
  end
end
