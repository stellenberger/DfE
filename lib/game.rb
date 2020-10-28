class Game 

  def initialize(server, receiver)
    @server = server
    @receiver = receiver
    @points_array = [0, 0]
    @points_hash = {
      0 => 'love',
      1 => 'fifteen',
      2 => 'thirty',
      3 => 'fourty'
    }
  end

  def point_to(player)
    player == @server ? point_to_server : point_to_receiver
  end

  def point_to_server
    @points_array[0] += 1  
  end

  def point_to_receiver
    @points_array[1] += 1  
  end

  def score
    "#{@points_hash[@points_array[0]]}, #{@points_hash[@points_array[1]]}"
  end
end