require_relative '../classes/music_album'

describe MusicAlbum do
  before(:all) do
    @album = MusicAlbum.new('2011/10/01', false, true)
  end

  describe '#initialize' do
    it 'should be an instance of the MusicAlbum class' do
      expect(@album).to be_an_instance_of MusicAlbum
    end
  end
end
