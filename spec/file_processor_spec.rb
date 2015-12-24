require 'spec_helper'
require 'file_processor'

describe FileProcessor do
  let(:filename) { 'spec/fixtures/commands.txt' }
  let(:file_processor) { described_class.new(filename) }
  let(:processor) { double }

  it 'is instantiated with a filename' do
    expect(file_processor.filename).to eq(filename)
  end

  it 'processes each line in the file' do
    expect(file_processor).to receive(:process).with(processor, "LINE ONE\n")
    expect(file_processor).to receive(:process).with(processor, "LINE TWO\n")
    expect(file_processor).to receive(:process).with(processor, "LINE THREE\n")
    file_processor.process_on(processor)
  end

  context 'processing a line' do
    let(:line) { " PLACE 1,2,NORTH \n" }
    before(:each) do
      allow(STDOUT).to receive(:puts)
      allow(processor).to receive(:process)
    end
    after(:each) do
      file_processor.send(:process, processor, line)
    end

    it 'strips whitespace from the line and outputs it to STDOUT' do
      expect(STDOUT).to receive(:puts).with('PLACE 1,2,NORTH')
    end

    it 'processes the line' do
      expect(processor).to receive(:process).with('PLACE 1,2,NORTH')
    end

    context 'which is nil' do
      let(:line) { nil }

      it 'returns a blank string' do
        expect(processor).to receive(:process).with('')
      end
    end
  end
end
