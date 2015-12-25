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
end
