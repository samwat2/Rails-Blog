class UsersController < ApplicationController
  def index
    @body_class = 'normal-background'
    @users = User.all
  end

  def new
    @body_class = 'intro-background'
    @user = User.new
  end

  def create
    p params
    @body_class = 'normal-background'
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account Created!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      p @user.errors.messages
      flash[:alert] = "Cannot create account!"
      render :new
    end   
  end

  def show
    @body_class = 'normal-background'
    @user = User.find(params[:id])
  end

  def edit
    @body_class = 'normal-background'
    @user = User.find(params[:id])
  end

  def update
    @body_class = 'normal-background'
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :terms)
  end
end
