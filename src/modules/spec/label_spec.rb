require './src/modules/label'
require './src/modules/book'

label1 = Label.new('test label', 'red')
label2 = Label.new('label 2', 'blue')
item = Book.new('20201201', label1, 'genre', 'author', { publisher: 'test publisher', cover_state: 'cover state test' })

describe Label do
  context 'When testing the label class' do
    it 'initiating the class should hold no items' do
      expect(label2.items.length).to eq 0
    end

    it 'adding item to the class should increase the number of items in the class' do
      label2.add_item(item)
      expect(label2.items.length).to eq 1
    end

    it 'deleting item should decrease the number of items in the class' do
      label2.remove_item(item)
      expect(label2.items.length).to eq 0
    end
  end
end
