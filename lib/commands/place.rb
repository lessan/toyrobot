require 'navigator'
require 'table'

module Commands
  # Set an object's location and angle, if valid
  class Place
    attr_reader :x, :y, :direction

    def initialize(*arguments)
      return unless arguments.size == 3
      x, y, direction = arguments
      @x = Integer(x.to_s) # raises ArgumentError if invalid
      @y = Integer(y.to_s) # raises ArgumentError if invalid
      @direction = direction.to_s.downcase
    end

    def execute(object)
      return unless valid?
      navigator = Navigator.new(object)
      navigator.move_to(x, y)
      navigator.turn_to(direction)
    end

    def valid?
      return unless Table.within_dimensions?(x, y)
      return unless Compass.validate_direction(direction)
      true
    end
  end
end
