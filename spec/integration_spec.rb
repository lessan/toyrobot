require 'spec_helper'
require 'simulator'
require 'file_processor'

describe 'integration' do
  let(:simulations) do
    [
      { filename: 'spec/fixtures/example_a.txt', result: /Output: 0,1,NORTH/ },
      { filename: 'spec/fixtures/example_b.txt', result: /Output: 0,0,WEST/ },
      { filename: 'spec/fixtures/example_c.txt', result: /Output: 3,3,NORTH/ }
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
