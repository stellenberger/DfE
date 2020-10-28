require 'game.rb'

describe Game do
  before(:each) do
    @server = "player 1"
    @receiver = "player 2"
    @game = Game.new(@server, @receiver)
  end

  context '#instantiation' do
    it 'can make an instance of itself' do
      expect(@game).to be_a Game
    end
  end

  context '#assigning points' do
    it 'can assign a point to the server, and return the score' do
      @game.point_to(@server)
      expect(@game.score).to eq '1, 0' 
    end
  end
end