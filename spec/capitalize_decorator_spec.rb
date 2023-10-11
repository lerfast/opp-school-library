require_relative '../lib/capitalize_decorator'
require_relative '../lib/nameable'

class MockNameable < Nameable
  def correct_name
    'test'
  end
end

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name' do
      nameable = MockNameable.new
      decorator = CapitalizeDecorator.new(nameable)

      expect(decorator.correct_name).to eq('Test')
    end
  end
end
