require 'navigator'

module Commands
  # Display an object's location and angle
  class Report
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      puts "Output: #{navigator.position.join(',')},#{navigator.direction.upcase}"
    end
  end
end
