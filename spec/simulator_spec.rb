require 'spec_helper'
require 'simulator'

describe Simulator do
  it 'initializes a Robot and sets it as an instance variable exposed via an attribute' do
    robot = double
    expect(Robot).to receive(:new).and_return(robot)
    simulator = described_class.new
    expect(simulator.robot).to eq(robot)
  end

  context 'processing a command string' do
    let(:simulator) { described_class.new }
    let(:command_string) { 'some string' }
    let(:command_parser) { double }
    let(:command) { double.as_null_object }
    before(:each) do
      allow(CommandParser).to receive(:new).and_return(command_parser)
      allow(command_parser).to receive(:parse).and_return(command)
    end

    it 'creates a CommandParser and passes it the command string' do
      expect(CommandParser).to receive(:new).with(command_string).and_return(command_parser)
      simulator.process(command_string)
    end

    it 'calls parse on the CommandParser instance' do
      expect(command_parser).to receive(:parse).and_return(double.as_null_object)
      simulator.process(command_string)
    end

    it 'executes the command passing it the robot' do
      expect(command).to receive(:execute).with(simulator.robot)
      simulator.process(command_string)
    end
  end
end
