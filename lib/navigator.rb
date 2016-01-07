require 'compass'
require 'direction_matrix'

# Maps navigation commands to an object that responds to x, y and angle
class Navigator
  attr_reader :object

  # object must conform to the interface:
  #   x      get/set integer
  #   y      get/set integer
  #   angle  get/set integer
  def initialize(object)
    @object = object
  end

  def placed?
    # we can assume an object is "placed" on the surface if it has
    #   a valid position and an angle set
    return false unless object.x.is_a?(Integer)
    return false unless object.y.is_a?(Integer)
    return false unless object.angle.is_a?(Integer)
    true
  end

  def position
    [object.x, object.y]
  end

  def direction
    Compass.direction_from(object.angle)
  end

  def propose_move_forward_in_current_direction
    x_offset, y_offset = DirectionMatrix.send(direction)
    [object.x + x_offset, object.y + y_offset]
  end

  # these methods mutate the object:

  def move_to(x, y)
    object.x = x
    object.y = y
  end

  def turn_right
    object.angle = Compass.rotate_clockwise_from(object.angle)
  end

  def turn_left
    object.angle = Compass.rotate_counter_clockwise_from(object.angle)
  end

  def turn_to(direction)
    object.angle = Compass.angle_from(direction)
  end
end
