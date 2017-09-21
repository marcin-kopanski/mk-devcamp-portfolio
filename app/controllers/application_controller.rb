class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContentConcern
  
  protect_from_forgery prepend: true, with: :exception
  
end