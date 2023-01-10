require_relative '../src/game'
require_relative '../src/item'

describe Game do
  before :all do
    @game = Game.new(true, '12/12/2012', '01/01/2002')
  end

  context '#initialize' do
    it 'takes 2 parameters and return an instance of Game' do
      expect(@game).to be_instance_of Game
    end
  end

  context '#can_be_archived?' do
    it 'returns true if parent method and last_played_at is not older than 2' do
      @item = Item.new('12/12/2001')
      expect(@item.can_be_archived? && @game.can_be_archived?).to be true
    end
  end
end
