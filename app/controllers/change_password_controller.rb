class ChangePasswordController < ApplicationController
#  load_and_authorize_resource
skip_authorization_check

  def edit
    if current_user.roles.include?"banned"
      raise CanCan::AccessDenied
    else
#    authorize! :edit, :User
    @user = User.find(current_user.id)
    end
  end

  def update_password
    @user = User.find(current_user.id)
#Devise
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
# Force to provide old pass
    if @user.update_with_password(params[:user])
      # ONLY FOR NON ADMIN
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to dashboard_path, :flash => { :success => 'Password berhasil di rubah' }
    else
      #Adding error
      @user.errors.add(:description, "Password lama harus diisi") if :current_password.empty?
      @user.errors.add(:description, "Password / password confirmation harus diisi") if :password.empty? or :password_confirmation.empty?
      @user.errors.add(:description, "Password dan password confirmation harus sama") if :password != :password_confirmation  
      render :action => 'edit'
    end
  end
end
