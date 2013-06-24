module ApplicationHelper

  def a_devise_page?
    puts "our controller is named #{controller.controller_name}"
    controller.controller_name == "registrations" || controller.controller_name ==  "sessions" || controller.controller_name == "passwords"
    # request.path =~ /session/ || request.path =~ /sign/ || request.path =~ /password/
  end

end
