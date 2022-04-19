require './classes/item'
require './classes/label'

describe Label do
  context 'Tests for the label class' do
    item = Item.new('2010/1/1', true)

    label = Label.new('test_title', 'red')

    it 'is an instance of class Item' do
      expect(label).to be_an_instance_of(Label)
    end
    it 'can add an item' do
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
