require 'command_parser'
require 'robot'

# Run a simulation on a Robot, one command at a time
class Simulator
  attr_reader :robot

  def initialize
    @robot = Robot.new
  end

  def process(command_string)
    command_parser = CommandParser.new(command_string)
    command = command_parser.parse
    command.execute(robot)
  end
end
