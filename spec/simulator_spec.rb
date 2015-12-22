require 'spec_helper'
require 'simulator'

describe Simulator do
  it 'processes commands' do
    described_class.process('commands')
  end
end
