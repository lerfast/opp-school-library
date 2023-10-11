require_relative '../lib/decorator'

RSpec.describe Decorator do
  let(:mock_nameable) { instance_double('Nameable') }

  before do
    allow(mock_nameable).to receive(:correct_name).and_return('MockName')
  end

  subject { Decorator.new(mock_nameable) }

  describe '#initialize' do
    it 'initializes with a given nameable object' do
      expect(subject.instance_variable_get(:@nameable)).to eq(mock_nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates to the nameable object' do
      expect(subject.correct_name).to eq('MockName')
    end
  end
end
