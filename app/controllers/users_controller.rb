class UsersController < ApplicationController
#skip_authorization_check
  load_and_authorize_resource
  def index
    @users = User.search(params[:search]).paginate(:per_page => 10, :page => params[:page])    
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])
#Devise
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to users_path, :flash => { :success => 'User was successfully updated.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.roles.include?"banned"
      @user.roles-=%w[ banned ]
      flashmsg="#{@user.email} berhasil di aktifkan"
    else
      @user.roles+=%w[ banned ]
      flashmsg="#{@user.email} berhasil di blok"
    end
    @user.save
    redirect_to users_path, :flash => { :success => flashmsg }
  end

  def update_password
    @user = User.find(current_user.id)
#    if @user.update_attributes(params[:user])
    if @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

end
