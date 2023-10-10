require 'spec_helper'
require_relative '../lib/models/person'

describe Person do
  subject(:person) { Person.new(25, name: "John Doe") }

  describe '#initialize' do
    it 'initializes with given age and name' do
      expect(person.age).to eq(25)
      expect(person.name).to eq("John Doe")
    end
  end
end
