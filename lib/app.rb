require 'json'

module Library
  class App
    attr_accessor :books, :people, :rentals

    def initialize
      load_data
      @books ||= []
      @people ||= []
      @rentals ||= []
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

    def save_data
      books_data = @books.map { |book| { title: book.title, author: book.author } }
      File.write('books.json', JSON.dump(books_data))

      people_data = @people.map do |person|
        if person.is_a?(Teacher)
          { id: person.id, name: person.name, age: person.age, specialization: person.specialization }
        else
          { id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission }
        end
      end
      File.write('people.json', JSON.dump(people_data))

      rentals_data = @rentals.map do |rental|
        {
          date: rental.date,
          book: { title: rental.book.title, author: rental.book.author },
          person: { name: rental.person.name, age: rental.person.age }
        }
      end
      File.write('rentals.json', JSON.dump(rentals_data))
    end

    def load_books
      return unless File.exist?('books.json')

      data = JSON.parse(File.read('books.json'))
      @books = data.map { |item| Book.new(item['title'], item['author']) }
    end

    def load_people
      return unless File.exist?('people.json')

      data = JSON.parse(File.read('people.json'))
      @people = data.map do |item|
        if item['specialization']
          Teacher.new(item['age'], id: item['id'], name: item['name'], specialization: item['specialization'])
        else
          Student.new(item['age'], id: item['id'], name: item['name'], parent_permission: item['parent_permission'])
        end
      end
    end

    def load_rentals
      return unless File.exist?('rentals.json')

      data = JSON.parse(File.read('rentals.json'))
      @rentals = data.map do |item|
        book = @books.find { |b| b.title == item['book']['title'] && b.author == item['book']['author'] }
        person = @people.find { |p| p.name == item['person']['name'] && p.age == item['person']['age'] }
        Rental.new(item['date'], book, person)
      end
    end

    def load_data
      load_books
      load_people
      load_rentals
    end
  end
end
