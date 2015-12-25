require 'navigator'

module Commands
  class Right
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      navigator.turn_right
    end
  end
end
