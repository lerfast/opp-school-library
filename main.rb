require_relative 'lib/app'
require_relative 'lib/user_interface'
require_relative 'lib/app_controller'
require_relative 'lib/models/book'
require_relative 'lib/models/classroom'
require_relative 'lib/models/person'
require_relative 'lib/models/persons/student'
require_relative 'lib/models/persons/teacher'
require_relative 'lib/models/rental'

app = Library::App.new
ui = Library::UserInterface.new(app)
controller = Library::AppController.new(app, ui)

controller.start
