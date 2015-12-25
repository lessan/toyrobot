require 'spec_helper'
require 'command_parser'

describe CommandParser do
  let(:command_parser) { described_class.new(command_string) }

  it 'provides a list of valid commands' do
    expect(described_class::VALID_COMMANDS).to be_a(Array)
  end

  context 'with a valid command' do
    let(:command_string) { 'REPORT' }

    it 'is instantiated with a command string' do
      expect(command_parser.command_string).to eq(command_string)
    end

    it 'creates a new command object of the specified type' do
      expect(Commands::Report).to receive(:new)
      command_parser.parse
    end

    it 'returns the command object' do
      result = command_parser.parse
      expect(result).to be_a(Commands::Report)
    end

    context 'with extra spacing' do
      let(:command_string) { '  REPORT ' }

      it 'parses the command name ignoring the spaces' do
        expect(Commands::Report).to receive(:new)
        command_parser.parse
      end
    end

    context 'in mixed case' do
      let(:command_string) { 'RePoRT' }

      it 'changes case so as to retrieve the correct command' do
        expect(Commands::Report).to receive(:new)
        command_parser.parse
      end
    end

    context 'with arguments' do
      let(:command_string) { 'PLACE X,Y,DIR' }

      it 'passes the arguments to the method call' do
        expect(Commands::Place).to receive(:new).with('X', 'Y', 'DIR')
        command_parser.parse
      end

      context 'that are spaced out' do
        let(:command_string) { 'PLACE   X  ,    Y  ,  DIR   ' }

        it 'passes the arguments with extra spacing removed' do
          expect(Commands::Place).to receive(:new).with('X', 'Y', 'DIR')
          command_parser.parse
        end
      end

      context 'that are not separated by commas' do
        let(:command_string) { 'PLACE X; Y; DIR' }

        it 'treats them as one argument' do
          expect(Commands::Place).to receive(:new).with('X; Y; DIR')
          command_parser.parse
        end
      end
    end
  end

  context 'invalid commands' do
    subject { command_parser.parse }

    context 'with an invalid command_string' do
      let(:command_string) { 'INVALID' }
      it { is_expected.to be_a(Commands::Invalid) }
    end

    context 'with command_string consisting of just spaces' do
      let(:command_string) { '  ' }
      it { is_expected.to be_a(Commands::Invalid) }
    end

    context 'with an empty command_string' do
      let(:command_string) { '' }
      it { is_expected.to be_a(Commands::Invalid) }
    end

    context 'with a nil command_string' do
      let(:command_string) { nil }
      it { is_expected.to be_a(Commands::Invalid) }
    end
  end
end
