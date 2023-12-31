require_relative '../person'
require_relative '../classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, id: nil, name: 'Unknown', parent_permission: true, classroom: nil)
    super(age, id: id, name: name, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
