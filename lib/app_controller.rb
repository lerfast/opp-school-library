module Library
  class AppController
    def initialize(app, user_interface)
      @app = app
      @ui = user_interface
    end

    def start
      choice = nil

      while choice != '7'
        @ui.display_menu
        choice = @ui.user_input

        case choice
        when '1'
          books = @app.list_all_books
          @ui.display_books(books)
        when '2'
          people = @app.list_all_people
          @ui.display_people(people)
        when '3'
          data = @ui.person_data
          if data
            response = @app.create_person(data[:type], data[:name], data[:age], data[:extra_attribute])
            @ui.display_response(response)
          end
        when '4'
          data = @ui.book_data
          response = @app.create_book(data[:title], data[:author])
          @ui.display_response(response)
        when '5'
          @ui.create_rental_ui
        when '6'
          id = @ui.person_id_for_rental
          rentals = @app.list_rentals_by_person_id(id)
          @ui.display_rentals(rentals)
        when '7'
          @ui.goodbye_message
          @app.save_data
        else
          @ui.invalid_option_message
        end
      end
    end
  end
end
