require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author = Author.new('Dean', 'Kutz')
  end

  context '#initialize' do
    it 'author should be an instance of Author' do
      expect(@author).to be_an_instance_of Author
    end

    it 'should have a first_name instance variable' do
      f_name = @author.first_name
      expect(f_name).to eq 'Dean'
    end

    it 'should have a first_name instance variable' do
      l_name = @author.last_name
      expect(l_name).to eq 'Kutz'
    end

    it 'should have an items array instance variable' do
      items = @author.items
      expect(items).to eq []
    end
  end

  context 'testing instance methods' do
    it 'increase author items count by 1' do
      initial_items = @author.items.size
      item_instance = Item.new('2011/10/01', false)
      @author.add_item(item_instance)
      new_items = @author.items.size
      expect(new_items).to eq(initial_items + 1)
    end

    it 'author item should be instance of Item class' do
      item_instance = Item.new('2011/10/01', false)
      @author.add_item(item_instance)
      author_item = @author.items.first
      expect(author_item).to be_an_instance_of Item
    end

    it 'add_item method should set author as author of item' do
      item_instance = Item.new('2011/10/01', false)
      @author.add_item(item_instance)
      item_author = item_instance.author
      expect(item_author).to be_an_instance_of Author
    end
  end
end
