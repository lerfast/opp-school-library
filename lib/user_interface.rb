module Library
  class UserInterface
    def initialize(app)
      @app = app
    end

    def start
      choice = nil

      while choice != '7'
        display_menu

        choice = gets.chomp

        case choice
        when '1'
          puts @app.list_all_books
        when '2'
          puts @app.list_all_people
        when '3'
          create_person_ui
        when '4'
          create_book_ui
        when '5'
          create_rental_ui
        when '6'
          list_rentals_by_person_id_ui
        when '7'
          puts 'Goodbye, and thank you for using my app!'
        else
          puts 'Invalid option. Please choose between 1 and 7.'
        end
      end
    end

    private

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

    def create_person_ui
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
        puts @app.create_person(:student, name, age, permission)
      when '2'
        print 'Specialization: '
        specialization = gets.chomp
        puts @app.create_person(:teacher, name, age, specialization)
      else
        puts 'Invalid option!'
      end
    end

    def create_book_ui
      print 'Title: '
      title = gets.chomp

      print 'Author: '
      author = gets.chomp

      puts @app.create_book(title, author)
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

    def list_rentals_by_person_id_ui
      print 'ID of person: '
      id = gets.chomp.to_i

      puts @app.list_rentals_by_person_id(id)
    end
  end
end
