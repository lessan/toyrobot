require 'spec_helper'
require 'type_checker'

describe TypeChecker do
  context 'checking if the argument is an integer' do
    subject { described_class.integer?(argument) }

    context 'with an integer' do
      let(:argument) { 0 }
      it { is_expected.to be true }
    end

    context 'with a float' do
      let(:argument) { 0.01 }
      it { is_expected.to be false }
    end

    context 'with nil' do
      let(:argument) { nil }
      it { is_expected.to be false }
    end

    context 'with a string' do
      let(:argument) { 'string' }
      it { is_expected.to be false }
    end
  end
end
