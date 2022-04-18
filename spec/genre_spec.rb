require_relative './classes/genre'

describe Genre do
    before(:all) do
        @genre = Genre.new('Comedy')
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
end