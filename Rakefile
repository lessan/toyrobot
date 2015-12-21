task default: [:run]

desc 'Load input from data/commands.txt and run the Robot Simulator'
task :run do
  $LOAD_PATH.unshift(File.dirname(__FILE__), 'lib')
  require 'robot_simulator'

  puts 'Robot Simulator'
  puts '---------------'

  puts 'Reading input from commands.txt:'
  commands = File.read('data/commands.txt')
  puts commands

  puts "\nProcessing input through the Robot Simulator..."
  RobotSimulator.process(commands)

  puts "\nSimulation ended."
end
