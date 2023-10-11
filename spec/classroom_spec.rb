require 'spec_helper'
require_relative '../lib/models/classroom'

describe Classroom do
  subject(:classroom) { Classroom.new('Math 101') }

  describe '#initialize' do
    it 'initializes with a given label' do
      expect(classroom.label).to eq('Math 101')
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      student = instance_double('Student')
      allow(student).to receive(:classroom=)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
