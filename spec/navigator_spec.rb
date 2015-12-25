require 'spec_helper'
require 'navigator'

describe Navigator do
  context 'initializing' do
    it 'sets the object argument to an instance variable and exposes it as an attribute' do
      object = double
      navigator = described_class.new(object)
      expect(navigator.object).to eq(object)
    end
  end

  context 'determining if an object is "placed" on a surface' do
    let(:x) { double }
    let(:y) { double }
    let(:angle) { double }
    let(:navigator) { described_class.new(double(x: x, y: y, angle: angle)) }
    before(:each) do
      allow(TypeChecker).to receive(:integer?).and_return(true)
    end

    it 'returns true if all type checks pass' do
      expect(navigator.placed?).to be(true)
    end

    it 'checks the type of x is an integer and returns false if it isnt' do
      expect(TypeChecker).to receive(:integer?).with(x).and_return(false)
      expect(navigator.placed?).to be(false)
    end

    it 'checks the type of y is an integer and returns false if it isnt' do
      expect(TypeChecker).to receive(:integer?).with(y).and_return(false)
      expect(navigator.placed?).to be(false)
    end

    it 'checks the angle of x is an integer and returns false if it isnt' do
      expect(TypeChecker).to receive(:integer?).with(angle).and_return(false)
      expect(navigator.placed?).to be(false)
    end
  end

  context "determining an object's position" do
    let(:navigator) { described_class.new(double(x: 12, y: 34)) }
    it 'returns an array of x and y' do
      expect(navigator.position).to eq([12, 34])
    end
  end

  context "determining an object's direction" do
    let(:navigator) { described_class.new(double(angle: 'angle')) }
    it 'returns an array of x and y' do
      expect(Compass).to receive(:direction_from).with('angle').and_return('return value')
      expect(navigator.direction).to eq('return value')
    end
  end

  context 'proposing a move' do
    let(:navigator) { described_class.new(double(x: 12, y: 34)) }

    it 'gets an x and y offset from the DirectionMatrix by sending it the current direction' do
      allow(navigator).to receive(:direction).and_return('direction')
      expect(DirectionMatrix).to receive(:send).with('direction').and_return([0, 0])
      navigator.propose_move_forward_in_current_direction
    end

    it "adds the x and y offsets to the object's x and y and returns them" do
      allow(navigator).to receive(:direction)
      allow(DirectionMatrix).to receive(:send).and_return([11, -5])
      x, y = navigator.propose_move_forward_in_current_direction
      expect(x).to eq(12 + 11)
      expect(y).to eq(34 - 5)
    end
  end

  context 'moving an object' do
    let(:object) { double }
    let(:navigator) { described_class.new(object) }

    it "sets the object's x and y attributes" do
      expect(object).to receive(:x=).with('new value for x')
      expect(object).to receive(:y=).with('new value for y')
      navigator.move_to('new value for x', 'new value for y')
    end
  end

  context 'turning an object' do
    let(:object) { double(angle: 'angle') }
    let(:navigator) { described_class.new(object) }

    context 'right' do
      it 'rotates an object clockwise, getting the new angle from Compass' do
        expect(Compass).to receive(:rotate_clockwise_from).with('angle').and_return('return value')
        expect(object).to receive(:angle=).with('return value')
        navigator.turn_right
      end
    end

    context 'left' do
      it 'rotates an object counter-clockwise, getting the new angle from Compass' do
        expect(Compass).to receive(:rotate_counter_clockwise_from).with('angle').and_return('return value')
        expect(object).to receive(:angle=).with('return value')
        navigator.turn_left
      end
    end

    context 'in a specific direction' do
      it 'sets a new angle based on the direction, obtained from Compass' do
        expect(Compass).to receive(:angle_from).with('new direction').and_return('return value')
        expect(object).to receive(:angle=).with('return value')
        navigator.turn_to('new direction')
      end
    end
  end
end