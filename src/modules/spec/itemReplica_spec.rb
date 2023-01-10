require './src/modules/item'
require './src/modules/label'

label1 = Label.new('test label', 'red')
label2 = Label.new('test label2', 'blue')

itemReplication1 = ItemReplication.new('20201201', label1, 'genre', 'author')


describe ItemReplication do
  context 'When testing the ItemReplication class methods' do
    it 'initiating the class should add self to label class items array' do
      expect(label1.items[0]).to be itemReplication1
    end

    it 'calling modify_label should delete self from old label class items array' do
      itemReplication1.modify_label(label2)
      expect(label1.items.length).to eq 0
    end

    it 'calling modify_label should add self to the new label items array' do
      expect(label2.items[0]).to be itemReplication1
    end

    it 'calling modify_label should modify its @label attr to equal the new label class' do
      expect(itemReplication1.label).to be label2
    end
  end
end
