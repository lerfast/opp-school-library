class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.add_rental(rental) unless book.rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
