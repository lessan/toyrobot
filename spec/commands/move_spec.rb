require 'spec_helper'
require 'commands/move'

describe Commands::Move do
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
        allow(Table).to receive(:within_dimensions?)
      end

      it 'invokes propose_move_forward_in_current_direction' do
        expect(navigator).to receive(:propose_move_forward_in_current_direction).and_return([0, 0])
        command.execute(object)
      end

      it 'checks that the proposed move is within the table dimensions' do
        allow(navigator).to receive(:propose_move_forward_in_current_direction).and_return([123, 456])
        expect(Table).to receive(:within_dimensions?).with(123, 456)
        command.execute(object)
      end

      it 'proceeds with the move if within dimensions' do
        allow(navigator).to receive(:propose_move_forward_in_current_direction).and_return([123, 456])
        allow(Table).to receive(:within_dimensions?).and_return(true)
        expect(navigator).to receive(:move_to).with(123, 456)
        command.execute(object)
      end
    end
  end
end
