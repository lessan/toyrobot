require 'spec_helper'
require 'table'

describe Table do
  it 'has a range of x dimensions' do
    expect(described_class::X_DIMENSIONS).to be_a(Range)
  end

  it 'has a range of y dimensions' do
    expect(described_class::Y_DIMENSIONS).to be_a(Range)
  end

  context 'responding to a check whether given coordinates are within dimensions' do
    let(:x) { 1 }
    let(:y) { 1 }

    it 'succeeds' do
      expect(described_class::within_dimensions?(x, y)).to be true
    end

    context 'with an x coordinate outside the dimensions' do
      let(:x) { -1 }

      it 'fails' do
        expect(described_class::within_dimensions?(x, y)).to be false
      end
    end

    context 'with a y coordinate outside the dimensions' do
      let(:y) { 999 }

      it 'fails' do
        expect(described_class::within_dimensions?(x, y)).to be false
      end
    end

    context 'with a nil coordinate' do
      let(:x) { nil }

      it 'fails' do
        expect(described_class::within_dimensions?(x, y)).to be false
      end
    end

    context 'with a string coordinate' do
      let(:x) { '1' }

      it 'fails' do
        expect(described_class::within_dimensions?(x, y)).to be false
      end
    end
  end
end
