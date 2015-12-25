require 'spec_helper'
require 'compass'

describe Compass do
  context 'validating a direction' do
    subject { described_class.validate_direction(direction) }

    context 'with a valid direction' do
      let(:direction) { 'east' }
      it { is_expected.to be true }
    end

    context 'with an invalid direction' do
      let(:direction) { 'easterly' }
      it { is_expected.to be false }
    end

    context 'with a valid direction in a different case' do
      let(:direction) { 'EaSt' }
      it { is_expected.to be true }
    end

    context 'with a nil direction' do
      let(:direction) { nil }
      it { is_expected.to be false }
    end
  end

  context 'getting an angle from a direction' do
    subject { described_class.angle_from(direction) }

    context 'with north' do
      let(:direction) { 'north' }
      it { is_expected.to eq(0) }
    end

    context 'with east' do
      let(:direction) { 'east' }
      it { is_expected.to eq(90) }
    end

    context 'with south' do
      let(:direction) { 'south' }
      it { is_expected.to eq(180) }
    end

    context 'with west' do
      let(:direction) { 'west' }
      it { is_expected.to eq(270) }
    end

    context 'with an invalid direction' do
      let(:direction) { 'NORTH' }
      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'with a nil direction' do
      let(:direction) { nil }
      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  context 'getting a direction from an angle' do
    subject { described_class.direction_from(angle) }

    context 'with 0' do
      let(:angle) { 0 }
      it { is_expected.to eq('north') }
    end

    context 'with 90' do
      let(:angle) { 90 }
      it { is_expected.to eq('east') }
    end

    context 'with 180' do
      let(:angle) { 180 }
      it { is_expected.to eq('south') }
    end

    context 'with 270' do
      let(:angle) { 270 }
      it { is_expected.to eq('west') }
    end

    context 'with an invalid angle' do
      let(:angle) { 1 }
      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'with a string as an angle' do
      let(:angle) { '90' }
      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'with a nil angle' do
      let(:angle) { nil }
      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  context 'rotating clockwise' do
    it 'adds 90 to the angle' do
      new_angle = described_class.rotate_clockwise_from(11)
      expect(new_angle).to eq (11 + 90)
    end
  end

  context 'rotating counter-clockwise' do
    it 'subtracts 90 from the angle' do
      new_angle = described_class.rotate_counter_clockwise_from(111)
      expect(new_angle).to eq (111 - 90)
    end

    it 'wraps around 360 degrees' do
      new_angle = described_class.rotate_counter_clockwise_from(0)
      expect(new_angle).to eq (270)
    end
  end
end
