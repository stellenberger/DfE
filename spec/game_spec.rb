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

    it 'can assign 2 points to the server, and return the score' do
      @game.point_to(@server)
      @game.point_to(@server)
      expect(@game.score).to eq '2, 0' 
    end

    it 'can assign one point to the receiver, and return the score' do
      @game.point_to(@receiver)
      expect(@game.score).to eq '0, 1'
    end

    it 'can assign two points to the receiver, and return the score' do
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      expect(@game.score).to eq '0, 2'
    end

    it 'can assign multiple points to both the receiver and server, and return the score' do
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      @game.point_to(@server)
      expect(@game.score).to eq '1, 2'
    end
  end
end