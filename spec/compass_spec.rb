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
end

