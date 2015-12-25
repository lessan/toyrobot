require 'spec_helper'
require 'commands/report'

describe Commands::Report do
  context 'executing' do
    let(:command) { described_class.new }
    let(:object) { double }
    let(:navigator) { double }
    before(:each) do
      allow(Navigator).to receive(:new).with(object).and_return(navigator)
    end

    it 'instantiates a navigator, returns if the object is not placed' do
      expect(Navigator).to receive(:new).with(object)
      allow(navigator).to receive(:placed?).and_return(false)
      command.execute(object)
    end

    context 'with a placed object' do
      before(:each) do
        allow(navigator).to receive(:placed?).and_return(true)
      end

      it 'outputs the position and direction (upcased) to STDOUT' do
        expect(navigator).to receive(:position).and_return([123, 456])
        expect(navigator).to receive(:direction).and_return('somewhere')
        expect(STDOUT).to receive(:puts).with('Output: 123,456,SOMEWHERE')
        command.execute(object)
      end
    end
  end
end
