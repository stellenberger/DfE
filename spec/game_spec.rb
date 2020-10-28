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
      expect(@game.score).to eq 'fifteen, love' 
    end

    it 'can assign 2 points to the server, and return the score' do
      @game.point_to(@server)
      @game.point_to(@server)
      expect(@game.score).to eq 'thirty, love' 
    end

    it 'can assign one point to the receiver, and return the score' do
      @game.point_to(@receiver)
      expect(@game.score).to eq 'love, fifteen'
    end

    it 'can assign two points to the receiver, and return the score' do
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      expect(@game.score).to eq 'love, thirty'
    end

    it 'can assign multiple points to both the receiver and server, and return the score' do
      @game.point_to(@receiver)
      @game.point_to(@receiver)
      @game.point_to(@server)
      expect(@game.score).to eq 'fifteen, thirty'
    end
  end

  context '#deuce score' do
    it 'will return deuce as a score if both players have 3 points' do
      3.times do 
        @game.point_to(@receiver)
        @game.point_to(@server)
      end
      expect(@game.score).to eq 'deuce'
    end
  end

  context '#game over' do
    it 'will return game and the name of the player if they have at least 5 points and 2 points ahead' do
      5.times do
        @game.point_to(@receiver)
      end
      expect(@game.score).to eq 'Game, player2'
    end

    it 'will return game and the name of the player if they have at least 5 points and 2 points ahead' do
      5.times do
        @game.point_to(@server)
      end
      expect(@game.score).to eq 'Game, player1'
    end
  end
end