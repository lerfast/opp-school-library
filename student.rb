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

  def join_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
