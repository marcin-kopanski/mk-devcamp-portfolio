module ApplicationHelper
   def login_helper
      if current_user.is_a?(GuestUser)
         (link_to "Register", new_user_registration_path) +
         "<br/>".html_safe +
         (link_to "Login", new_user_session_path)
      else
         link_to "Logout", destroy_user_session_path, method: :delete
      end
   end
   
   # przyklad
   def sample_helper
      content_tag(:div, "My Content", class: "my-class")
   end
   
   def source_helper(layout_name)
      if session[:source]
         greeting = "Thank you for visiting me from #{ session[:source] } and you are on #{ layout_name } layout"
         content_tag(:p, greeting, class: "source-greeting")
      end
   end
   
   def copyright_generator
      KopanskiViewTool::Renderer.copyright "Marcin Kopański", "All rights reserved"
   end
end