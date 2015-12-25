require 'spec_helper'
require 'commands/place'

describe Commands::Place do
  context 'initializing' do
    context 'with valid arguments' do
      let(:command) { described_class.new('1', '2', 'NORTH') }

      it 'converts x to an integer and sets it as an instance variable, exposed via an attribute' do
        expect(command.x).to eq(1)
      end

      it 'converts y to an integer and sets it as an instance variable, exposed via an attribute' do
        expect(command.y).to eq(2)
      end

      it 'changes direction to lowercase sets it as an instance variable, exposed via an attribute' do
        expect(command.direction).to eq('north')
      end
    end

    context 'with too many arguments' do
      let(:command) { described_class.new('1', '2', 'NORTH', 'fourth') }

      it 'does not set any instance variables' do
        expect(command.x).to be_nil
        expect(command.y).to be_nil
        expect(command.direction).to be_nil
      end
    end

    context 'with too few arguments' do
      let(:command) { described_class.new('1') }

      it 'does not set any instance variables' do
        expect(command.x).to be_nil
        expect(command.y).to be_nil
        expect(command.direction).to be_nil
      end
    end

    context 'with a non-integer for x' do
      it 'raises an ArgumentError if a non-integer is supplied for x' do
        expect do
          described_class.new('a', '2', 'NORTH')
        end.to raise_error(ArgumentError)
      end
    end

    context 'with a non-integer for y' do
      it 'raises an ArgumentError if nil is supplied for y' do
        expect do
          described_class.new('1', nil, 'NORTH')
        end.to raise_error(ArgumentError)
      end
    end

    context 'with a nil direction' do
      let(:command) { described_class.new('1', '2', nil) }

      it 'converts it to a blank string' do
        expect(command.x).to eq(1)
        expect(command.y).to eq(2)
        expect(command.direction).to eq('')
      end
    end
  end

  context 'validating' do
    let(:x) { '1' }
    let(:y) { '2' }
    let(:direction) { 'NORTH' }
    let(:command) { described_class.new(x, y, direction) }

    it 'succeeds with valid input' do
      expect(command.valid?).to be true
    end

    context 'with an invalid x' do
      let(:x) { '99' }
      it 'fails' do
        expect(command.valid?).to be_falsey
      end
    end

    context 'with an invalid y' do
      let(:y) { '-1' }
      it 'fails' do
        expect(command.valid?).to be_falsey
      end
    end

    context 'with an invalid direction' do
      let(:direction) { 'NORTHERN' }
      it 'fails' do
        expect(command.valid?).to be_falsey
      end
    end
  end

  context 'executing' do
    let(:command) { described_class.new('1', '2', 'NORTH') }
    let(:object) { double }
    let(:navigator) { double.as_null_object }

    it 'returns if invalid' do
      allow(command).to receive(:valid?).and_return(false)
      expect(command.execute(object)).to be_falsey
      expect(Navigator).not_to receive(:new)
    end

    it 'instantiates a navigator' do
      expect(Navigator).to receive(:new).with(object).and_return(navigator)
      command.execute(object)
    end

    context 'with a navigator instantiated' do
      before(:each) do
        allow(Navigator).to receive(:new).with(object).and_return(navigator)
      end

      it 'invokes move with x and y' do
        expect(navigator).to receive(:move_to).with(1, 2)
        command.execute(object)
      end

      it 'invokes turn_to with direction' do
        expect(navigator).to receive(:turn_to).with('north')
        command.execute(object)
      end
    end
  end
end
