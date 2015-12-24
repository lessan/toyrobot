task default: [:run]

desc 'Load input from data/commands.txt and run the Robot Simulator'
task :run do
  $LOAD_PATH.unshift(File.dirname(__FILE__), 'lib')
  require 'simulator'
  require 'file_processor'

  filename = 'data/commands.txt'

  puts 'Robot Simulator'
  puts '---------------'
  puts "Input is being read line by line from #{filename}:\n\n"
  simulator = Simulator.new
  file_processor = FileProcessor.new(filename)
  file_processor.process_on(simulator)
  puts "\nSimulation ended."
end
