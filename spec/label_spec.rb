require_relative '../classes/structure/item'
require_relative '../classes/structure/label'

describe Label do
  context 'Tests for the label class' do
    item = Item.new('2010/1/1', true)
    title = 'Topaz'
    color = 'Red'
    label = Label.new(title, color)

    it 'is an instance of class Item' do
      expect(label).to be_an_instance_of(Label)
    end
    it 'can add an item' do
      label.add_item(item)
      expect(label.items).to include(item)
    end
    it 'can add label' do
      expect(item.label).to eq(label)
    end

    it 'Check if label attributes match' do
      expect(label).to have_attributes(title: title, color: color)
    end
  end
end
