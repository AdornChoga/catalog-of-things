require './classes/author'

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
  end
end
