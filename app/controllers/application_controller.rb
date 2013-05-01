class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :unless => :root_url
  check_authorization :unless => :devise_controller?

#Routing error
#  rescue_from ActionController::RoutingError, :with => :render_not_found
  rescue_from ActionController::RoutingError do |exception|
    raise CanCan::AccessDenied
  end
 
  def routing_error
#    raise ActionController::RoutingError.new(params[:path])
    raise CanCan::AccessDenied
  end
   
  def render_not_found
#    render :template => "misc/404"
    redirect_to root_url, :alert => exception.message
  end


#Cancan enforced authorization
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
