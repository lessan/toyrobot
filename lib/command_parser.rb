class CommandParser
  attr_reader :command_string

  VALID_COMMANDS = %w(place move left right report) # must be lowercase

  def initialize(command_string)
    @command_string = command_string.to_s
  end

  def perform_on(object)
    command, arguments = prepare_command_and_arguments
    return unless command_is_valid?(command)
    object.send command, arguments
  end

  private

  def prepare_command_and_arguments
    raw_command, raw_arguments = command_string.split(' ', 2)
    [prepare_command(raw_command), prepare_arguments(raw_arguments)]
  end

  def prepare_command(raw_command)
    raw_command.to_s.downcase
  end

  def prepare_arguments(raw_arguments)
    raw_arguments.to_s.split(',').map!(&:strip)
  end

  def command_is_valid?(command)
    VALID_COMMANDS.include? command
  end
end
