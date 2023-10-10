require 'spec_helper'
require_relative '../lib/models/persons/teacher'

describe Teacher do
  subject(:teacher) { Teacher.new(30, name: 'Mr. Smith', specialization: 'Math') }
  describe '#initialize' do
    it 'initializes with given age, name, and specialization' do
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('Mr. Smith')
      expect(teacher.specialization).to eq('Math')
    end
  end
end
