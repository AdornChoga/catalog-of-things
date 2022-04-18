require './classes/game'
require './classes/item'

describe Game do
  before :each do
    @game = Game.new(true, '2019/01/01')
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

  context 'testing Game methods' do
    it 'can_archived should return true' do
      item = Item.new('2010/01/01', true)
      archiving = @game.can_be_archived?
      expect(archiving).to eq true
    end

    it 'can_archived should return false' do
      item = Item.new('2015/01/01', true)
      archiving = @game.can_be_archived?
      expect(archiving).to eq false
    end

    it 'can_archived should return false' do
      game_instance = Game.new(true, '2022/01/01')
      item = Item.new('2010/01/01', true)
      archiving = game_instance.can_be_archived?
      expect(archiving).to eq false
    end
  end
end
