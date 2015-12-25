module Compass
  def self.validate_direction(direction)
    %w(north south east west).include? direction.to_s.downcase
  end
end
