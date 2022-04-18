require_relative '../classes/genre'

describe Genre do
  before(:all) do
    @genre = Genre.new('Comedy')
    @item = Item.new('2011/10/01', false)
  end

  it 'should be an instance of Genre' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'should have a name' do
    expect(@genre.name).to eq('Comedy')
  end

  it 'should have a list of items' do
    expect(@genre.items).to be_an_instance_of Array
  end

  context 'test relationship between genre and item' do
    it 'should add an item to the genre' do
      @genre.add_item(@item)
      expect(@genre.items).to include(@item)
    end

    it 'should have atleast one item in the genre' do
      expect(@genre.items.length).to be > 0
    end

    it 'item should have comedy as its genre' do
      expect(@item.genre.name).to eq('Comedy')
    end
  end
end
