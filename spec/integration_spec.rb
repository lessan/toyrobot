require 'spec_helper'
require 'simulator'
require 'file_processor'

describe 'integration' do
  let(:simulations) do
    [
      { filename: 'spec/fixtures/example_a.txt', result: /Output: 0,1,NORTH/ },
      { filename: 'spec/fixtures/example_b.txt', result: /Output: 0,0,WEST/ },
      { filename: 'spec/fixtures/example_c.txt', result: /Output: 3,3,NORTH/ },
      { filename: 'spec/fixtures/charlie.txt',   result: /Output: 1,2,NORTH.*Output: 0,4,WEST.*Output: 2,0,EAST/m }
    ]
  end

  it 'runs through a few simulations' do
    simulations.each do |spec|
      simulator = Simulator.new
      file_processor = FileProcessor.new(spec[:filename])
      expect { file_processor.process_on(simulator) }.to output(spec[:result]).to_stdout
    end
  end
end
