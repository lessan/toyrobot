require 'spec_helper'
require 'direction_matrix'

describe DirectionMatrix do
  it 'provides a method for each direction' do
    expect(described_class.north).to eq [0,1]
    expect(described_class.east).to eq [1,0]
    expect(described_class.south).to eq [0,-1]
    expect(described_class.west).to eq [-1,0]
  end
end
