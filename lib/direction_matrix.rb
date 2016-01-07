# Manipulate directional matrices
module DirectionMatrix
  # given an array with an x and y co-ordinate: [x, y]
  # we navigate in a direction by adding or subtracting
  # from the x or y component

  def self.north
    [0, 1] # i.e. x + 0, y + 1
  end

  def self.east
    [1, 0] # i.e. x + 1, y + 0
  end

  def self.south
    [0, -1] # i.e. x + 0, y - 1
  end

  def self.west
    [-1, 0] # i.e. x - 1, y + 0
  end
end
