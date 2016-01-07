# Has dimensions and can determine if a location is within those dimensions
class Table
  X_DIMENSIONS = 0..4
  Y_DIMENSIONS = 0..4

  # x and y are expected to be integers (not strings)
  def self.within_dimensions?(x, y)
    X_DIMENSIONS.include?(x) && Y_DIMENSIONS.include?(y)
  end
end
