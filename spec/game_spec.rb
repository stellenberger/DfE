require 'game.rb'

describe Game do
  context '#instantiation' do
    it 'can make an instance of itself' do
      instance = Game.new
      expect(instance).to be_a Game
    end
  end
end