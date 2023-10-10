require 'spec_helper'
require_relative '../lib/models/persons/student'

describe Student do
  subject(:student) { Student.new(20, name: "Jane Doe", parent_permission: true) }
    describe '#initialize' do
      it 'initializes with given age, name, and parent_permission' do
      expect(student.age).to eq(20)
      expect(student.name).to eq("Jane Doe")
      expect(student.parent_permission).to be_truthy
    end
  end
end
