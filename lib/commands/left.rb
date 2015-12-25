require 'navigator'

module Commands
  class Left
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      navigator.turn_left
    end
  end
end
