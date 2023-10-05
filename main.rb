require_relative 'app'

def main
  app = App.new
  choice = nil

  while choice != "7"
    puts "\n---WELCOME TO MY SCHOOL LIBRARY APP Created by: Luis Emilio Rojas ---"
    puts "\nPlease choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person (teacher or student)"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals by person ID"
    puts "7 - Exit\n\n"

    choice = gets.chomp

    case choice
    when "1"
      app.list_all_books
    when "2"
      app.list_all_people
    when "3"
      app.create_person
    when "4"
      app.create_book
    when "5"
      app.create_rental
    when "6"
      app.list_rentals_by_person_id
    when "7"
      puts "Goodbye!"
    else
      puts "Invalid option. Please choose between 1 and 7."
    end
  end
end

main
