class ApplicationController < ActionController::Base
  protect_from_forgery

#Cancan enforced authorization
#  check_authorization
  #Devise redirect
  def after_sign_in_path_for(resource)
   dashboard_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

#Cancan forced exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
