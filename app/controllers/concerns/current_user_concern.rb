module CurrentUserConcern
   extend ActiveSupport::Concern
   
   included do
      before_action :current_user
   end
  
   def current_user
      super || guest_user
   end
   
   def guest_user
      guest = GuestUser.new
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest_user@test.pl"
      
      # OpenStruct.new(name: "Guest User", 
      #                first_name: "Guest", 
      #                last_name: "User", 
      #                email: "guest_user@test.pl")
      
      guest
   end
end