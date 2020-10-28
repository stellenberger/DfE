class Game 

  def initialize(server, receiver)
    @server = server
    @receiver = receiver
    @points_array = [0, 0]
  end

  def point_to(player)
    @points_array[0] += 1
  end

  def score
    "#{@points_array[0]}, #{@points_array[1]}"
  end
end