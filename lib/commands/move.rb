require 'navigator'
require 'table'

module Commands
  # Change an object's location, if valid
  class Move
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      new_x, new_y = navigator.propose_move_forward_in_current_direction
      return unless Table.within_dimensions?(new_x, new_y)
      navigator.move_to(new_x, new_y)
    end
  end
end
