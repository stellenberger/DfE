class Game 

  def initialize(server, receiver)
    @server = server
    @receiver = receiver
    @points_array = [0, 0]
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
    "#{@points_array[0]}, #{@points_array[1]}"
  end
end