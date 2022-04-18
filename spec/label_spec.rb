require '../classes/booklabel'
require '../classes/item'

describe Label do
  context 'Tests for the label class' do
    item = Item.new(2010)

    label = Label.new('test_title', 'red')

    it 'is an instance of class Item' do
      expect(label).to be_an_instance_of(Label)
    end

    it 'can add an item, also adding the label to the item' do
      label.add_item(item)

      expect(label.items).to include(item)

      expect(item.label).to eq(label)
    end
  end
end
