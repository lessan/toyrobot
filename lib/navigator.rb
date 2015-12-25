require 'type_checker'
require 'compass'
require 'direction_matrix'

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
    # a valid position and an angle set
    return false unless TypeChecker.integer?(object.x)
    return false unless TypeChecker.integer?(object.y)
    return false unless TypeChecker.integer?(object.angle)
    true
  end
end
