module Compass
  def self.validate_direction(direction)
    %w(north south east west).include? direction.to_s.downcase
  end

  def self.angle_from(direction)
    return 0   if direction == 'north'
    return 90  if direction == 'east'
    return 180 if direction == 'south'
    return 270 if direction == 'west'
    fail ArgumentError, "Invalid direction: #{direction.inspect}"
  end

  def self.direction_from(angle)
    return 'north' if angle == 0
    return 'east'  if angle == 90
    return 'south' if angle == 180
    return 'west'  if angle == 270
    fail ArgumentError, "Invalid angle: #{angle.inspect}"
  end

  def self.rotate_clockwise_from(angle)
    new_angle = angle + 90
    new_angle -= 360 if new_angle >= 360
    new_angle
  end

  def self.rotate_counter_clockwise_from(angle)
    new_angle = angle - 90
    new_angle += 360 if new_angle < 0
    new_angle
  end
end
