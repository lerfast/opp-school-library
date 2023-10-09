require_relative '../person'

class Teacher < Person
  attr_reader :specialization
  def initialize(age, name = 'Unknown', specialization)
    super(age, name, true)
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end
