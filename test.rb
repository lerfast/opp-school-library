require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
puts "Original name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed name: #{capitalized_trimmed_person.correct_name}"

classroom = Classroom.new('5th Grade')
student = Student.new('maximilianus', 22, true, classroom)
puts "#{student.name} belongs to the classroom: #{student.classroom.label}"

book = Book.new('Harry Potter', 'J.K. Rowling')
rental = Rental.new('2023-10-02', book, person)
puts "#{person.name} borrowed the book #{rental.book.title} on #{rental.date}"
