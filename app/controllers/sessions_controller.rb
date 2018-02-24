class SessionsController < ApplicationController
  def new
    @body_class = 'intro-background'
  end

  def create
    @body_class = 'normal-background'
  	@user = User.where(email: params[:email]).first
  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to @user
  	else
      flash[:alert] = "Email or Password is incorrect."
      render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
