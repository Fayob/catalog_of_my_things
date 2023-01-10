require './src/modules/book'

book1 = Book.new('20201201', 'test publisher', 'good')
book2 = Book.new('20201201', 'test publisher', 'bad')

describe Book do
  context 'When testing the Book class can_be_archived? method' do
    it 'initiating the class should set archived attr to false' do
      expect(book1.archived).to be false
    end

    it 'calling can_be_archived? should override parent method and return true if cover_status is "good"' do
      book1.move_to_archive
      expect(book1.archived).to be false
    end

    it 'calling can_be_archived? should override parent method and return true if cover_status is "good"' do
      book2.move_to_archive
      expect(book2.archived).to be true
    end
  end
end
