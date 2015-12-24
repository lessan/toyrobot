require 'spec_helper'
require 'robot'

describe Robot do
  it 'exposes certain attributes' do
    robot = described_class.new
    expect(robot).to respond_to(:x)
    expect(robot).to respond_to(:y)
    expect(robot).to respond_to(:angle)
  end
end
