require 'spec_helper'
require 'robot_simulator'

describe RobotSimulator do
  it 'processes commands' do
    described_class.process('commands')
  end
end
