require 'navigator'

module Commands
  # Change an object's angle towards the right
  class Right
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      navigator.turn_right
    end
  end
end
