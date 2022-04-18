require_relative '../classes/music_album'

describe MusicAlbum do
    before(:all) do
        @album = MusicAlbum.new('2011/10/01', false, true)
    end

    describe '#initialize' do
        expect(@album).to be_an_instance_of MusicAlbum
    end

    context 'test can_be_archived? method' do
        it 'should return true if the parent\'s method returns true and if on_spotify equals true' do
            expect(@album.can_be_archived?).to eq(true)
        end

        it 'should return false if the parent\'s method returns false' do
            album_instance = MusicAlbum.new('2020/10/01', false, true)
            expect(album_instance.can_be_archived?).to eq(false)
        end

        it 'should return false if the on_spotify attribute is false' do
            album_instance = MusicAlbum.new('2020/10/01', false, false)
            expect(album_instance.can_be_archived?).to eq(false)
        end
    end
end