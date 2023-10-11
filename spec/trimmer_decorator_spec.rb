require_relative '../lib/trimmer_decorator'
require_relative '../lib/nameable'

class MockLongNameable < Nameable
  def correct_name
    'thisisaverylongname'
  end
end

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'trims the name to 10 characters' do
      nameable = MockLongNameable.new
      decorator = TrimmerDecorator.new(nameable)

      expect(decorator.correct_name).to eq('thisisaver')
    end
  end
end
