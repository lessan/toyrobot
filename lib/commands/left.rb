require 'navigator'

module Commands
  # Change an object's angle towards the left
  class Left
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      navigator.turn_left
    end
  end
end
