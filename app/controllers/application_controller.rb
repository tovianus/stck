class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD
#Cancan enforced authorization
#  check_authorization
  #Devise redirect
  def after_sign_in_path_for(resource)
   dashboard_path
  end
#Cancan forced exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
=======
>>>>>>> ee5bd40868cd70e8c7e1a08ae51c161ebc640b8c
end
