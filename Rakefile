task default: [:run]

desc 'Load input from data/commands.txt and run the Robot Simulator'
task :run do
  $LOAD_PATH.unshift(File.dirname(__FILE__), 'lib')
  require 'simulator'

  puts 'Robot Simulator'
  puts '---------------'

  puts 'Reading input from commands.txt:'
  commands = File.read('data/commands.txt')
  puts commands

  puts "\nProcessing input through the Robot Simulator..."
  Simulator.process(commands)

  puts "\nSimulation ended."
end
