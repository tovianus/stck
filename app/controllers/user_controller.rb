class UserController < ApplicationController
  skip_authorization_check

  def index
    @index=User.all    
  end


end
