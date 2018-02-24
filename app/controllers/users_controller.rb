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
    @body_class = 'normal-background'
    @user = User.create(user_params)
    redirect_to @user
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
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
