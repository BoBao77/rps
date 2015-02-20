# This file is named application_controller.rb
# It contains the class ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
