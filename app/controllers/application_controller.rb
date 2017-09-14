class ApplicationController < ActionController::Base
  include DeviseWhiteslit
  
  protect_from_forgery with: :exception
  
end