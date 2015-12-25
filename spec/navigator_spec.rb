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
end
