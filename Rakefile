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

desc 'Run the Robot Simulator reading commands from standard input'
task :stdin do
  $LOAD_PATH.unshift(File.dirname(__FILE__), 'lib')
  require 'simulator'
  require 'file_processor'

  puts 'Robot Simulator'
  puts '---------------'
  puts 'Type one command at a time then press ENTER'
  puts 'Valid commands are:'
  puts "\tPLACE X,Y,DIRECTION"
  puts "\tMOVE"
  puts "\tLEFT"
  puts "\tRIGHT"
  puts "\tREPORT"
  puts "Press ENTER without any commands to exit\n\n"

  simulator = Simulator.new
  while input_line = $stdin.gets
    input_line.strip!
    break if input_line == ''
    simulator.process(input_line)
  end
  puts 'Simulation ended.'
end
