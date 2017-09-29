module ApplicationHelper
   def login_helper style = ''
      if current_user.is_a?(GuestUser)
         (link_to "Register", new_user_registration_path, class: style) +
         (link_to "Login", new_user_session_path, class: style)
      else
         (link_to "Logout", destroy_user_session_path, method: :delete, class: style)
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
   
   def nav_items
      [
         {
            url: root_path,
            title: "Home"
         },
         {
            url: about_me_path,
            title: "About me"
         },
         {
            url: contact_path,
            title: "Contact"
         },
         {
            url: blogs_path,
            title: "Blog"
         },
         {
            url: portfolios_path,
            title: "Portfolio"
         }
      ]
   end
   
   def nav_helpler css_class, html_tag
      
      # nav_links = <<NAV
      # <#{html_tag}><a href="#{root_path}" class="#{css_class} #{active? root_path}">Home</a></#{html_tag}>
      # <#{html_tag}><a href="#{about_me_path}" class="#{css_class} #{active? about_me_path}">About me</a></#{html_tag}>
      # <#{html_tag}><a href="#{contact_path}" class="#{css_class} #{active? contact_path}">Contact</a></#{html_tag}>
      # <#{html_tag}><a href="#{blogs_path}" class="#{css_class} #{active? blogs_path}">Blog</a></#{html_tag}>
      # <#{html_tag}><a href="#{portfolios_path}" class="#{css_class} #{active? portfolios_path}">Portfolio</a></#{html_tag}>
      # NAV
      
      nav_links = ""
      
      nav_items.each do |item|
         nav_links << "<#{html_tag}><a href=\"#{item[:url]}\" class=\"#{css_class} #{active? item[:url]}\">#{item[:title]}</a></#{html_tag}>"
      end

      nav_links.html_safe
   end
   
   def active? path
      "active" if current_page? path
   end
   
   def alerts
      alert = (flash[:alert] || flash[:error] || flash[:notice])
      
      if alert
         alert_generator alert
      end
   end
   
   def alert_generator msg
      js add_gritter(msg, title: "Marcin Kopański Portfolio", sticky: false, time: 2000)
   end
end