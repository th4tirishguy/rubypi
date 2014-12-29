class UserController < ApplicationController
  def new
  	if !session[:logged_in].nil?
  		@user = User.new
  	else
  		flash[:alert] = "You are already logged in"
  		redirect_to :root
  	end
  end

  def create
  	@user = User.new
  	@user.username = params["/signup"][:username]
  	@user.email = params["/signup"][:email]
  	@user.access_level = 3
  	@user.encrypt_password(params["/signup"][:password])
  	if @user.save
  		flash[:notice] = "Thanks for signing up"
  		session[:logged_in] = true
  		session[:user_access_level] = @user.access_level
  		redirect_to :root
  	else
  		flash.now[:alert] = "There was a problem signing up"
  		render new
  	end
  end
end
