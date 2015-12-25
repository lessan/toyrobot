require 'navigator'

module Commands
  class Report
    def execute(object)
      navigator = Navigator.new(object)
      return unless navigator.placed?
      puts "Output: #{navigator.position.join(',')},#{navigator.direction.upcase}"
    end
  end
end
