module Library
  class App
    attr_accessor :books, :people, :rentals

    def initialize
      @books = []
      @people = []
      @rentals = []
    end

    def list_all_books
      return 'No Book found!!!' if @books.empty?

      @books.map { |book| "Title: #{book.title}, Author: #{book.author}" }
    end

    def list_all_people
      return ['No People found!!!'] if @people.empty?

      @people.map do |person|
        if person.is_a?(Student)
          classroom_label = person.classroom ? person.classroom.label : 'No Classroom'
          "Type: Student, ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Classroom: #{classroom_label}, Number of Rentals: #{person.rentals.count}"
        else
          "Type: Teacher, ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, Number of Rentals: #{person.rentals.count}"
        end
      end
    end

    def create_person(type, name, age, extra_attribute = nil)
      case type
      when :student
        student = Student.new(age, name: name, parent_permission: extra_attribute)
        @people << student
        'Student created successfully!'
      when :teacher
        teacher = Teacher.new(age, name: name, specialization: extra_attribute)
        @people << teacher
        'Teacher created successfully!'
      else
        'Invalid person type!'
      end
    end

    def create_book(title, author)
      book = Book.new(title, author)
      @books << book
      'Book created successfully!'
    end

    def create_rental(book_index, person_index, date)
      book = @books[book_index]
      person = @people[person_index]
      rental = Rental.new(date, book, person)
      @rentals << rental
      'Rental created successfully!'
    end

    def list_rentals_by_person_id(id)
      rentals = @rentals.filter { |rental| rental.person.id == id }

      return "The person with ID #{id} hasn't rented any books." if rentals.empty?

      rentals.map { |rental| "Date: #{rental.date}, Book: #{rental.book.title}" }
    end
  end
end
