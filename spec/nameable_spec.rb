require_relative '../lib/nameable'

describe Nameable do
  describe '#correct_name' do
    it 'raises a NotImplementedError' do
      nameable_instance = Nameable.new

      expect { nameable_instance.correct_name }.to raise_error(NotImplementedError)
    end
  end
end