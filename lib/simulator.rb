require 'command_parser'
require 'robot'
require 'table'
require 'navigator'

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
