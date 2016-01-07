require_relative 'commands/place'
require_relative 'commands/move'
require_relative 'commands/left'
require_relative 'commands/right'
require_relative 'commands/report'
require_relative 'commands/invalid'

# Parse a command string and return a command object
#   corresponding to the contents of the string
class CommandParser
  attr_reader :command_string

  # These correspond to files such as lib/commands/place.rb
  VALID_COMMANDS = %w(Place Move Left Right Report)
  INVALID_COMMAND = 'Invalid'

  def initialize(command_string)
    @command_string = command_string.to_s
  end

  def parse
    command, arguments = prepare_command_and_arguments
    unless command_is_valid?(command)
      command = INVALID_COMMAND
      arguments = nil
    end
    Commands.const_get(command.to_sym).new(*arguments)
  end

  private

  def prepare_command_and_arguments
    raw_command, raw_arguments = command_string.split(' ', 2)
    [prepare_command(raw_command), prepare_arguments(raw_arguments)]
  end

  def prepare_command(raw_command)
    raw_command.to_s.capitalize
  end

  def prepare_arguments(raw_arguments)
    raw_arguments.to_s.split(',').map!(&:strip)
  end

  def command_is_valid?(command)
    VALID_COMMANDS.include? command
  end
end
