module Library
  class UserInterface
    attr_reader :app

    def initialize(app)
      @app = app
    end

    def display_menu
      puts "\n WELCOME TO MY SCHOOL LIBRARY APP By: Luis Emilio Rojas"
      puts "\nPlease choose an option by entering a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person (teacher or student)'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals by person ID'
      puts '7 - Exit'
    end

    def user_input
      gets.chomp
    end

    def display_books(books)
      if books.is_a?(String)
        puts books
      else
        books.each { |book| puts book }
      end
    end

    def display_people(people)
      if people.is_a?(String)
        puts people
      else
        people.each { |person| puts person }
      end
    end

    def person_data
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      choice = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp.to_i

      case choice
      when '1'
        print 'Has parent permission? [Y/N]: '
        permission = gets.chomp.downcase == 'y'
        { type: :student, name: name, age: age, parent_permission: permission }
      when '2'
        print 'Specialization: '
        specialization = gets.chomp
        { type: :teacher, name: name, age: age, specialization: specialization }
      else
        puts 'Invalid option!'
        nil
      end
    end

    def book_data
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      { title: title, author: author }
    end

    def create_rental_ui
      puts 'Select a book from the following list by number:'
      @app.books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number:'
      @app.people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      puts @app.create_rental(book_index, person_index, date)
    end

    def rental_data
      print 'Book index: '
      book_index = gets.chomp.to_i
      print 'Person index: '
      person_index = gets.chomp.to_i
      print 'Date: '
      date = gets.chomp
      { book_index: book_index, person_index: person_index, date: date }
    end

    def person_id_for_rental
      print 'ID of person: '
      gets.chomp.to_i
    end

    def display_rentals(rentals)
      if rentals.is_a?(String)
        puts rentals
      else
        rentals.each { |rental| puts rental }
      end
    end

    def display_response(response)
      puts response
    end

    def invalid_option_message
      puts 'Invalid option. Please choose between 1 and 7.'
    end

    def goodbye_message
      puts 'Goodbye, and thank you for using my app!'
    end
  end
end
