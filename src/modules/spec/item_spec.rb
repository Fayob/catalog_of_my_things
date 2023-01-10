require './src/item'
require './src/modules/label'

label1 = Label.new('test label', 'red')
label2 = Label.new('test label2', 'blue')

item_replication1 = Item.new('20201201')

describe Item do
  context 'When testing the Item class methods' do
    it 'calling modify_label should delete self from old label class items array' do
      item_replication1.modify_label(label1)
      item_replication1.modify_label(label2)
      expect(label1.items.length).to eq 0
    end

    it 'calling modify_label should add self to the new label items array' do
      expect(label2.items[0]).to be item_replication1
    end

    it 'calling modify_label should modify its @label attr to equal the new label class' do
      expect(item_replication1.label).to be label2
    end
  end
end
