require 'pry'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No Book found!!!'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No People found!!!'
    else
      @people.each do |person|
        binding.pry
        if person.is_a?(Student)
          puts "Type: Student, ID: #{person.id}, Name: #{person.age}, Age: #{person.name}, Classroom: #{person.classroom.label}, Number of Rentals: #{person.rentals.count}"
        else
          puts "Type: Teacher, ID: #{person.id}, Name: #{person.age}, Age: #{person.name}, Number of Rentals: #{person.rentals.count}"
        end
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    if choice == '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'

      print 'Classroom: '
      classroom = gets.chomp

      student = Student.new(name, age.to_i, permission, Classroom.new(classroom))
      @people << student

      puts 'Student created successfully!'
    elsif choice == '2'
      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(name, age.to_i, true, specialization)
      @people << teacher

      puts 'Teacher created successfully!'
    else
      puts 'Invalid option!'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental

    puts 'Rental created successfully!'
  end

  def list_rentals_by_person_id
    if @rentals.empty?
      puts 'No Rentals Found!!!!'
    else
      print 'ID of person: '
      id = gets.chomp.to_i

      rentals = @rentals.filter { |rental| rental.person.id == id }

      if rentals.empty?
        puts "The person with ID #{id} hasn't rented any books."
      else
        puts 'Rentals:'
        rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
      end
    end
  end
end
