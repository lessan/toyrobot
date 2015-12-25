require 'spec_helper'
require 'direction_matrix'

describe DirectionMatrix do
  it 'provides a method for each direction' do
    expect(described_class).to respond_to(:north)
    expect(described_class).to respond_to(:east)
    expect(described_class).to respond_to(:south)
    expect(described_class).to respond_to(:west)
  end
end
