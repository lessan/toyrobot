require 'command_parser'
require 'spec_helper'

describe CommandParser do
  let(:command_parser) { described_class.new(command_string) }

  it 'provides a list of valid commands' do
    expect(described_class::VALID_COMMANDS).to be_a(Array)
  end

  context 'with a valid command' do
    let(:command_string) { 'REPORT' }
    let(:object) { double }

    it 'is instantiated with a command string' do
      expect(command_parser.command_string).to eq(command_string)
    end

    it 'invokes the method on the object' do
      expect(object).to receive(:report)
      command_parser.perform_on(object)
    end

    it 'returns the result' do
      allow(object).to receive(:report).and_return('return value')
      result = command_parser.perform_on(object)
      expect(result).to eq('return value')
    end

    context 'with extra spacing' do
      let(:command_string) { '  REPORT ' }

      it 'parses the method name ignoring the spaces' do
        expect(object).to receive(:report)
        command_parser.perform_on(object)
      end
    end

    context 'in mixed case' do
      let(:command_string) { 'RePoRT' }

      it 'invokes the method name in lowercase' do
        expect(object).to receive(:report)
        command_parser.perform_on(object)
      end
    end

    context 'with arguments' do
      let(:command_string) { 'PLACE X,Y,DIR' }

      it 'passes the arguments to the method call' do
        expect(object).to receive(:place).with(%w(X Y DIR))
        command_parser.perform_on(object)
      end

      context 'that are spaced out' do
        let(:command_string) { 'PLACE   X  ,    Y  ,  DIR   ' }

        it 'passes the arguments with extra spacing removed' do
          expect(object).to receive(:place).with(%w(X Y DIR))
          command_parser.perform_on(object)
        end
      end

      context 'that are not separated by commas' do
        let(:command_string) { 'PLACE X; Y; DIR' }

        it 'treats them as one argument' do
          expect(object).to receive(:place).with(['X; Y; DIR'])
          command_parser.perform_on(object)
        end
      end
    end
  end

  context 'with an invalid command' do
    let(:command_string) { 'INVALID' }

    it 'no methods are invoked' do
      command_parser.perform_on(double)
    end
  end

  context 'with command consisting of just spaces' do
    let(:command_string) { '  ' }

    it 'no methods are invoked' do
      command_parser.perform_on(double)
    end
  end

  context 'with command consisting of an empty string' do
    let(:command_string) { '' }

    it 'no methods are invoked' do
      command_parser.perform_on(double)
    end
  end

  context 'with a nil command' do
    let(:command_string) { nil }

    it 'no methods are invoked' do
      command_parser.perform_on(double)
    end
  end
end
