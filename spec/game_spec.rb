require_relative '../classes/structure/game'
require_relative '../classes/structure/item'

describe Game do
  before :each do
    @game = Game.new(true, '2019/01/01', '2011/01/01', false)
  end

  context '#initialize' do
    it 'game should be an instance of Game' do
      expect(@game).to be_an_instance_of Game
    end

    it 'should have multiplayer instance variable' do
      expect(@game.multiplayer).to eq true
    end

    it 'should have last_played_at instance variable' do
      expect(@game.last_played_at.to_s).to eq '2019-01-01'
    end

    it 'last_played_at should be a Date object' do
      expect(@game.last_played_at).to be_kind_of Date
    end
  end
end
