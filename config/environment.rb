# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Zaqueu::Application.initialize!

Date::DATE_FORMATS[:default] = '%d/%m/%Y'
