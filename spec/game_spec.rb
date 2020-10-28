require 'game.rb'

describe Game do
  before(:each) do
    server = "player 1"
    receiver = "player 2"
    @instance = Game.new(server, receiver)
  end

  context '#instantiation' do
    it 'can make an instance of itself' do
      expect(@instance).to be_a Game
    end
  end


end