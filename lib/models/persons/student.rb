require_relative '../person'
require_relative '../classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission = true, classroom = nil)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom&.add_student(self) unless classroom.nil?
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
