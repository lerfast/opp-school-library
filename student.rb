require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, parent_permission, classroom = nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
